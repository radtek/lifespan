#ifndef NS_SIMPLE_CACHE
#define NS_SIMPLE_CACHE

#include "ns_ex.h"
#include "ns_thread.h"
#include <type_traits>
#include <map>

//#define NS_VERBOSE_IMAGE_CACHE

#ifdef  NS_VERBOSE_IMAGE_CACHE
#include <iostream>
#endif


template<class data_t, bool locked>
class ns_simple_cache_internal_object;

template<class data_t, class cache_key_t, bool locked>
class ns_simple_cache;

//an example base class for the data stored in the cache
template<class id_t, class external_source_t, class cache_key_t>
class ns_simple_cache_data {

	template<class a, class b, bool c>
	friend class ns_simple_cache;

private:
	virtual ns_64_bit size_in_memory_in_kbytes()const = 0;

	virtual void load_from_external_source(const id_t & id, external_source_t & external_source) = 0;

	virtual cache_key_t to_id(const id_t & id) const = 0;
	virtual const cache_key_t & id() const =0 ;

	virtual void clean_up(external_source_t & external_source) = 0;

	typedef id_t id_type;
	typedef external_source_t external_source_type;

};

template<class data_t, class cache_key_t, bool locked>
class ns_simple_cache_data_handle {
  typedef typename std::remove_cv<data_t>::type data_type;
public:

	ns_simple_cache_data_handle():obj(0), obj_const(0),data(0) {}
	data_t & operator()() { return *data; }
	const data_t &operator()() const { return *data; }
	bool is_valid() const{
		return data != 0;
	}
	~ns_simple_cache_data_handle() { check_in(); }
	void release() { check_in(); }

	friend  data_t;
	template<class a, class b, bool c>
	friend class ns_simple_cache;

private:
	data_t * data; //the image cached in memory.

	void check_out(bool to_write, 
		       ns_simple_cache_internal_object<data_type,locked> * o, 
		       ns_simple_cache<data_type, cache_key_t,locked> *c){
	  //not locked as the cache object will be locked while checking this object out
	  obj = o;
	  obj->object_metadata_lock.wait_to_acquire(__FILE__, __LINE__);
	  data = &obj->data;
	  obj->number_checked_out_by_any_threads++;
	  obj->last_access = ns_current_time();
	  write = to_write;
	  obj->object_metadata_lock.release();
	}
	void check_out(bool to_write,
		       ns_simple_cache_internal_object<const data_type,locked> * o,
		       ns_simple_cache<const data_type, cache_key_t, locked> * c){
	  obj_const = o;
	  obj_const->object_metadata_lock.wait_to_acquire(__FILE__, __LINE__);
	  data = &obj_const->data;
	  obj_const->number_checked_out_by_any_threads++;
	  obj_const->last_access = ns_current_time();
	  write = to_write;
	  obj_const->object_metadata_lock.release();
	}
	
 
	void check_in();
	const ns_simple_cache_internal_object<const data_type, locked> * obj_const;
	ns_simple_cache_internal_object<data_type, locked> * obj;

	bool write;

};

template<class second_t>
struct ns_cache_object_sort_by_age {
	ns_cache_object_sort_by_age() {}
	ns_cache_object_sort_by_age(unsigned long i, second_t & p) :pair(i, p) {}
	std::pair<unsigned long, second_t> pair;
	//note this returns the /reverse/ ordering, so we can get sort in order of oldest to youngest
	bool operator()(const ns_cache_object_sort_by_age<second_t> & a, const ns_cache_object_sort_by_age<second_t> & b) {
		return a.pair.first > b.pair.first;
	}
};

template<class data_t, bool locked>
class ns_simple_cache_internal_object {
public:
	ns_simple_cache_internal_object() :
		object_write_lock("owl"),object_metadata_lock("col"),to_be_deleted(false), number_checked_out_by_any_threads(0) {}

	typedef data_t data_type;

	mutable unsigned long last_access; //the last time (in UNIX time seconds) that the image was requested from the cache

	data_t data;

	mutable ns_lock object_write_lock, object_metadata_lock;

	mutable int number_checked_out_by_any_threads;
	mutable bool to_be_deleted;

	//friend data_t;
	//friend class ns_simple_cache<data_t,locked>;
};

///ns_image_cache implements a local cache for images loaded from the central file server.
///After an image is requested, ns_image_cache maintains a copy in memory for later use.
///Maximum memory usage can be specified (images in memory run ~750Mb and a few of these can
///exausts windows virtual memory default limits).  When the cache size is exceeded older images are deleted.
template<class data_t, class cache_key_t, bool locked>
class ns_simple_cache {

//	friend data_t;

public:

	ns_simple_cache(const unsigned long & max_memory_usage_) :
		disk_cached_cleared(false),
		max_memory_usage_in_kb(max_memory_usage_),
		current_memory_usage_in_kb(0), object_write_requests_pending(0),
		lock("clock"), delete_lock("dl"){}

	typedef ns_simple_cache_data_handle<data_t, cache_key_t,locked> handle_t;
	typedef ns_simple_cache_data_handle<const data_t, cache_key_t, locked> const_handle_t;

	typedef typename data_t::external_source_type external_source_type;

	void set_memory_allocation_limit_in_kb(const unsigned long & max) {//in kilobytes
		max_memory_usage_in_kb = max;
	}
       
	void get_for_read(const typename data_t::id_type & id, const_handle_t & cache_object, typename data_t::external_source_type & external_source){
	  get_image(id,&cache_object,external_source,true);
	}

	void get_for_write(const typename data_t::id_type & id, handle_t & cache_object, typename data_t::external_source_type & external_source) {
		get_image(id, &cache_object, external_source, false);
	}

	//clears the cache without allowing any of its contents the opportunity to clean up any external resources
	void clear_cache_without_cleanup() {
		wait_for_all_current_operations_to_be_processed_and_get_delete_and_table_lock();
		try {
			//get all write locks!
			//is it really that simple? 
			for (typename cache_t::iterator p = data_cache.begin(); p != data_cache.end(); p++) {
				p->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);
				p->second.object_write_lock.release();
			}
			this->current_memory_usage_in_kb = 0;
			data_cache.clear();
			if (locked) {
				lock.release();
				delete_lock.release();
			}
		}
		catch (...) {
			if (locked) {
				lock.release();
				delete_lock.release();
			}
		}
	}

	//empties the cache. this locks the entire table.
	void clear_cache(typename data_t::external_source_type & external_source) {
		remove_old_images<false>(true, 0, external_source);
	}

	//to minimize whole-table locks, deleting elements doesn't actually delete the internal cache structure
	//but instead leaves a stub that can be reused later.
	//these stubs are only a couple of bytes, but they could potentially add up, so 
	//this function cleares them out (at the cost of locking the whole table)
	void pause_everything_to_clean_up_internal_structures() {
		wait_for_all_current_operations_to_be_processed_and_get_delete_and_table_lock();
		for (cache_t::iterator p = data_cache.begin(); p != data_cache.end();) {
			if (p->second.to_be_deleted)
				p = data_cache.erase(p);
			else ++p;
		}
	}
	//removes old objects from the cache until its contents are below the maximum size
	//this does not lock the whole table
	void delete_objects_to_get_down_to_size(typename data_t::external_source_type & external_source) {
		remove_old_images<true>(false, 0, external_source);
	}
	void remove_old_images(unsigned long age_in_seconds, typename data_t::external_source_type & external_source) {
		remove_old_images<false>(false,age_in_seconds, external_source);
	}


private:

	bool disk_cached_cleared;
	ns_64_bit max_memory_usage_in_kb;
	ns_64_bit current_memory_usage_in_kb;

	typedef ns_simple_cache_internal_object<data_t, locked> internal_object_t;
	typedef std::map<cache_key_t, internal_object_t > cache_t;

	cache_t data_cache;


	//remove old images, in order of their age.
	//if only_pair_down_to_max_size is true, images are deleted only until the cache is below its maximum requested size.
	//if lock_all_and_clear_quickly is set to true, then the entire cache is locked while all objects are deleted,
	//which is a lot faster (as deletion wont wait on any new readers) for the calling thread, but of course
	//is much slower for any other threads looking to access cache.
	template<bool only_pair_down_to_max_size>
	void remove_old_images(bool lock_all_and_clear_quickly, unsigned long age_in_seconds, typename data_t::external_source_type & external_source) {
		//clear memory cache and all records
		long number_of_objects_in_cache(-1),
			number_of_objects_deleted(0);
		while (true) {

			bool action_taken_this_round(false);
			//if we are allowing other threads to access the cache while we're cleaning up
			//there's a potential for them to put new objects in a a rate greater than we can
			//delete them.  So, we only will try to delete as many objects as there were in the cache when we started
			//to avoid the risk of looping forever.
			if (!lock_all_and_clear_quickly &&
				number_of_objects_in_cache != -1 &&
				number_of_objects_deleted > number_of_objects_in_cache)
				break;

			if (lock_all_and_clear_quickly)
				wait_for_all_current_operations_to_be_processed_and_get_delete_and_table_lock();
			else lock.wait_to_acquire(__FILE__, __LINE__);

			if (number_of_objects_in_cache == -1)
				number_of_objects_in_cache = data_cache.size();
			//order elements by age
			std::vector<ns_cache_object_sort_by_age<typename cache_t::iterator> > objects_sorted_by_age(data_cache.size());
			unsigned long int i = 0;
			for (typename cache_t::iterator p = data_cache.begin(); p != data_cache.end(); p++) {
				objects_sorted_by_age[i] = ns_cache_object_sort_by_age<typename cache_t::iterator>(p->second.last_access, p);
				i++;
			}
			std::sort(objects_sorted_by_age.begin(), objects_sorted_by_age.end(), ns_cache_object_sort_by_age<cache_t::iterator>());


			try {
				//now we wait to grab write access to every object in the cache.
				const unsigned long current_time(ns_current_time());
				for (unsigned int i = 0; i < objects_sorted_by_age.size(); i++) {

					if (only_pair_down_to_max_size && current_memory_usage_in_kb <= max_memory_usage_in_kb)
						break;

					cache_t::iterator p = objects_sorted_by_age[i].pair.second;
					if (p->second.to_be_deleted) {
						continue;
					}
					if (locked) {
						object_write_requests_pending++;
						lock.release();
						p->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);
						lock.wait_to_acquire(__FILE__, __LINE__);
						object_write_requests_pending--;
					}

					if (age_in_seconds == 0 || p->second.last_access + age_in_seconds < current_time) {

						poll_until_no_threads_are_reading_from_object(p);

						current_memory_usage_in_kb -= p->second.data.size_in_memory_in_kbytes();

						if (!lock_all_and_clear_quickly) {
							//we're going to do the cleanup while not locking the cache, so we flag the deletion to be done later.
							action_taken_this_round = true;
							p->second.to_be_deleted = true;
							if (locked) lock.release();
						}

						p->second.data.clean_up(external_source);
						if (locked) p->second.object_write_lock.release();
						if (lock_all_and_clear_quickly)
							data_cache.erase(p);
						else
							break;
					}
					else 
						p->second.object_write_lock.release();
				}

				if (locked) {
					if (lock_all_and_clear_quickly) delete_lock.release();
					//if an action was taken, the lock has already been released
					if (!(!lock_all_and_clear_quickly && action_taken_this_round )) lock.release();
				}
				if (!action_taken_this_round)
					return;
			}
			catch (...) {
				if (locked) {
					if(lock_all_and_clear_quickly) delete_lock.release();
					lock.release();
				}
				throw;
			}
		}
	}


	void wait_for_all_current_operations_to_be_processed_and_get_delete_and_table_lock() {
		if (locked) {
			//first we block any clients from creating new read or write requests.
			delete_lock.wait_to_acquire(__FILE__, __LINE__);
			//now we wait for any read or write requests to be granted
			while (true) {
				lock.wait_to_acquire(__FILE__, __LINE__);
				if (object_write_requests_pending == 0) {
					break;
				}
				lock.release();
				ns_thread::sleep_microseconds(100);
			}
		}
	}


	void poll_until_no_threads_are_reading_from_object(typename cache_t::iterator & p) {
		while (true) {
			p->second.object_metadata_lock.wait_to_acquire(__FILE__, __LINE__);
			if (p->second.number_checked_out_by_any_threads == 0) {
				p->second.object_metadata_lock.release();
				break;
			}
			p->second.object_metadata_lock.release();
			ns_thread::sleep_microseconds(100);
		}
	}


	//data_type_t will be either data_type or const data_type depending on whether 
	template<class handle_t>
	void get_image(const typename data_t::id_type & id,
					handle_t * handle,
					typename data_t::external_source_type & external_source,
					bool read_only) {
		bool initial_read_request(read_only);
		//check to see if we have this in the cache somewhere
		bool currently_have_write_lock(false), currently_have_table_lock(false);

		//used to convert ids.
		const data_t dt;

		try {
			//grab the lock needed to access anything
			if (locked) {
				//wait for any delete jobs to finish.
				delete_lock.wait_to_acquire(__FILE__, __LINE__);
				delete_lock.release();
				lock.wait_to_acquire(__FILE__, __LINE__);
				currently_have_table_lock = true;
			}
			//look for the image in the cache.
			typename cache_t::iterator p = data_cache.find(dt.to_id(id));

			//create a new cache entry if one isn't already there!
			if (p == data_cache.end()) {
				std::cerr << "$";
				typename cache_t::iterator p;
				//create a new cache entry for the new image, and reserve it for writing
				//{
				internal_object_t foo;
				const cache_key_t id_num = dt.to_id(id);
				p = data_cache.emplace(std::piecewise_construct, std::make_tuple(id_num), std::make_tuple()).first;

				p->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);
				setup_new_cache_object_and_handle_and_release_locks(id,handle,external_source,read_only,p);
				return;
			}

			//some cleanup needs to be done.
			if (p->second.to_be_deleted)
				read_only = false;

			if (!read_only) {

				//if we want write access, we need to wait until anyone currently reading is finished
				//and then block out anyone who wants to read.
				object_write_requests_pending++;
				//waiting on the object write lock can potentially take a long time.
				//we can't hold up all access to the table in the meantime!
				lock.release();
				currently_have_table_lock = false;
				p->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);  //this wont be given up until the object ns_simple_cache object is destructed!

				if (locked) {
					//now we need to wait for any threads that are still reading.
					//we minimize the # of locks by polling just a here.
					poll_until_no_threads_are_reading_from_object(p);
				}
				//ok, we have exlusive read/write access to the object,
				//but not the table.
				if (locked) lock.wait_to_acquire(__FILE__, __LINE__);
				currently_have_table_lock = true;
				object_write_requests_pending--;

				//somebody wants to delete this.  But we're requesting a new version of it!
				//so rather than deleting it, we can just try to create a new version
				if (p->second.to_be_deleted) {
					try {
						p->second.data.clean_up(external_source);
					}
					catch (...) {
						if (locked) p->second.object_write_lock.release();
						throw;
					}
					std::cerr << "%";
					p->second.to_be_deleted = false;
					setup_new_cache_object_and_handle_and_release_locks(id, handle, external_source, initial_read_request, p);
					return;
				}

				//we have exclusive write access to a record no-one is reading!  We're done. 
				handle->check_out(true, &(p->second), this);
				if (locked)lock.release();
				return;
			}
			else {
				//At this stage we 1)have the object being looked for and 2) only need read access to it.
				//so we just need to wait until nobody is writing to it. 
				//if we don't do this, reads may supersede requests for writes that arrived before them.
				if (locked) {
					//we need to wait until any threads waiting to write to this object
					//have finished doing so.
					if (currently_have_write_lock)
						throw ns_ex("YIKES");
					object_write_requests_pending++;
					lock.release();
					p->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);
					lock.wait_to_acquire(__FILE__, __LINE__);
					object_write_requests_pending--;
					currently_have_write_lock = true;
				}

				//we have the write lock, so nobody else does!  check it out, and since we're 
				//only looking for read access, give back the write lock.
				handle->check_out(false, &p->second, this);
				p->second.object_write_lock.release();
				if (locked)lock.release();
				return;
			}

		}
		catch (...) {
			if (locked && currently_have_table_lock) lock.release();
			throw;
		}
	}

	//must have object write access and table lock before calling!
	template<class handle_t>
	void setup_new_cache_object_and_handle_and_release_locks(const typename data_t::id_type & id,
		handle_t * handle,
		typename data_t::external_source_type & external_source,
		bool read_only, typename cache_t::iterator p) {
		handle->check_out(true, &p->second, this);  //check it out for writing.
		lock.release();//release the lock so everything else can read and write other objects in the background while we load
					   //this one in.
		try {
			p->second.data.load_from_external_source(id, external_source);
		}
		catch (...) {
			p->second.object_write_lock.release();
			p->second.to_be_deleted = true;  //we can't delete this now, because we've already given up the main lock.  but we can flag it for deletion next time it's encountered
			throw;
		}
#ifdef NS_VERBOSE_IMAGE_CACHE
		std::cerr << "Inserting new image with size " << image_size << " into the cache.  \nCache status is currently " << current_memory_usage / 1024 << "/" << max_memory_usage / 1024 << "\n";
#endif
		//ok! We've loaded the data into the new position in the map.  populate it with interesting info.
		p->second.last_access = ns_current_time();
		current_memory_usage_in_kb += p->second.data.size_in_memory_in_kbytes();

		if (!read_only)
			return;  //we already have write access and everything loaded into cached_object, give it to the user.

					 //lets give up write access manually here, and pass the remaining object, no read only, on to the user
		p->second.object_write_lock.release();
		handle->write = false;
		return;
	}


	void make_room_in_memory(const unsigned long new_image_memory_req_in_kb, typename data_t::external_source_type & external_source) {
#ifdef NS_VERBOSE_IMAGE_CACHE
		if (current_memory_usage + new_image_memory_req > max_memory_usage) {
			std::cerr << "Memory cache " << current_memory_usage / 1024 << "/" << max_memory_usage / 1024 << " cannot fit new entry (" << new_image_memory_req << ").  Deleting oldest entries.\n";
		}
#endif
		cache_key_t target_id(-1);
		while (current_memory_usage_in_kb + new_image_memory_req_in_kb > max_memory_usage_in_kb) {
			if (locked)lock.wait_to_acquire(__FILE__, __LINE__);
			typename cache_t::iterator oldest_in_memory = data_cache.begin();
			bool found(false);

			for (typename cache_t::iterator p = data_cache.begin(); p != data_cache.end(); p++) {
			       
				if (p == target_id) {
					oldest_in_memory = p;
					found = true;
					break;
				}
				if (p->second.last_access <= oldest_in_memory->second.last_access) {
					found = true;
					oldest_in_memory = p;
				}
			}

			if (!found) {
#ifdef NS_VERBOSE_IMAGE_CACHE
				std::cerr << "Accepting cache overflow.\n";
#endif
				//memory is full.  We roll with it and allow the memory cache to get too large
				if (locked) lock.release();
				return;
			}
			//we have a write lock on a specific object, but it's been modified somehow and can't be found.  
			if (locked && target_id != -1 && oldest_in_memory->second.id != target_id) {
				lock.release();
				throw ns_ex("The cache seems to have been corrupted!");
			}


			//we have the object but we need to grab its wait lock
			if (locked && target_id == -1) {
				if (locked) {
					//if someone else is writing to it, there's a chance it could have been deleted, so we need to wait and then go back
					//and load it again
					if (oldest_in_memory->second.number_waiting_to_write > 0) {
						target_id = oldest_in_memory->second.id;
						oldest_in_memory->second.number_waiting_to_write++;
						lock.release();
						oldest_in_memory->second.object_write_lock.wait_to_acquire(__FILE__, __LINE__);
						continue;
					}
				}
			}
			//ok we've finally found the oldest in memory and we hold its write lock.

#ifdef NS_VERBOSE_IMAGE_CACHE
			std::cerr << "Deleting image of size " << oldest_in_memory->second.size_in_memory / 1024 << " dated " << ns_format_time_string(oldest_in_memory->second.last_access) << "\n";
#endif
			current_memory_usage_in_kb -= oldest_in_memory->second.data.size_in_memory_in_kb();
			oldest_in_memory().clean_up(external_source);
			data_cache.erase(oldest_in_memory);
		}
		lock.release();
		return;
	}
	mutable ns_lock lock, delete_lock;
	mutable long object_write_requests_pending;
};

template<class data_t, class cache_key_t, bool locked>
  inline void ns_simple_cache_data_handle<data_t, cache_key_t,locked>::check_in() {
  //we release this first, so that anyone holding the main lock
  //and waiting for the write lock will continue;
	if (obj != 0){
		if (locked) obj->object_metadata_lock.wait_to_acquire(__FILE__, __LINE__);
		obj->number_checked_out_by_any_threads--;
		if (locked) obj->object_metadata_lock.release();
		if (locked && write) obj->object_write_lock.release();
    obj = 0;
  }
  if (obj_const != 0) {
	  if (locked) obj_const->object_metadata_lock.wait_to_acquire(__FILE__, __LINE__);
	  obj_const->number_checked_out_by_any_threads--;
	  if (locked) obj_const->object_metadata_lock.release();
	  if (locked && write) obj_const->object_write_lock.release();
	  obj_const = 0;
  }
  data = 0;
}



void ns_test_simple_cache(char * debug_output);


#endif
