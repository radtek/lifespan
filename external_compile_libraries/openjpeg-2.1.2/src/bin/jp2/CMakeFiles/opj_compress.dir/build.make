# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2

# Include any dependencies generated for this target.
include src/bin/jp2/CMakeFiles/opj_compress.dir/depend.make

# Include the progress variables for this target.
include src/bin/jp2/CMakeFiles/opj_compress.dir/progress.make

# Include the compile flags for this target's objects.
include src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o: src/bin/jp2/opj_compress.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/opj_compress.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/opj_compress.c

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/opj_compress.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/opj_compress.c > CMakeFiles/opj_compress.dir/opj_compress.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/opj_compress.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/opj_compress.c -o CMakeFiles/opj_compress.dir/opj_compress.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o: src/bin/jp2/convert.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/convert.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convert.c

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/convert.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convert.c > CMakeFiles/opj_compress.dir/convert.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/convert.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convert.c -o CMakeFiles/opj_compress.dir/convert.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o: src/bin/jp2/convertbmp.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/convertbmp.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertbmp.c

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/convertbmp.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertbmp.c > CMakeFiles/opj_compress.dir/convertbmp.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/convertbmp.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertbmp.c -o CMakeFiles/opj_compress.dir/convertbmp.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o: src/bin/jp2/index.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/index.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/index.c

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/index.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/index.c > CMakeFiles/opj_compress.dir/index.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/index.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/index.c -o CMakeFiles/opj_compress.dir/index.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o: src/bin/common/color.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/__/common/color.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/color.c

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/__/common/color.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/color.c > CMakeFiles/opj_compress.dir/__/common/color.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/__/common/color.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/color.c -o CMakeFiles/opj_compress.dir/__/common/color.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o: src/bin/common/opj_getopt.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/opj_getopt.c

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/opj_getopt.c > CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/common/opj_getopt.c -o CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o: src/bin/jp2/converttif.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/converttif.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/converttif.c

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/converttif.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/converttif.c > CMakeFiles/opj_compress.dir/converttif.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/converttif.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/converttif.c -o CMakeFiles/opj_compress.dir/converttif.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o: src/bin/jp2/CMakeFiles/opj_compress.dir/flags.make
src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o: src/bin/jp2/convertpng.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/opj_compress.dir/convertpng.c.o   -c /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertpng.c

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/opj_compress.dir/convertpng.c.i"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertpng.c > CMakeFiles/opj_compress.dir/convertpng.c.i

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/opj_compress.dir/convertpng.c.s"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/convertpng.c -o CMakeFiles/opj_compress.dir/convertpng.c.s

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.requires:
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.requires

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.provides: src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.requires
	$(MAKE) -f src/bin/jp2/CMakeFiles/opj_compress.dir/build.make src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.provides.build
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.provides

src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.provides.build: src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o

# Object files for target opj_compress
opj_compress_OBJECTS = \
"CMakeFiles/opj_compress.dir/opj_compress.c.o" \
"CMakeFiles/opj_compress.dir/convert.c.o" \
"CMakeFiles/opj_compress.dir/convertbmp.c.o" \
"CMakeFiles/opj_compress.dir/index.c.o" \
"CMakeFiles/opj_compress.dir/__/common/color.c.o" \
"CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o" \
"CMakeFiles/opj_compress.dir/converttif.c.o" \
"CMakeFiles/opj_compress.dir/convertpng.c.o"

# External object files for target opj_compress
opj_compress_EXTERNAL_OBJECTS =

bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/build.make
bin/opj_compress: bin/libopenjp2.so.2.1.2
bin/opj_compress: /usr/lib64/libpng.so
bin/opj_compress: /usr/lib64/libz.so
bin/opj_compress: /usr/lib64/libtiff.so
bin/opj_compress: /usr/lib64/libz.so
bin/opj_compress: /usr/lib64/libtiff.so
bin/opj_compress: src/bin/jp2/CMakeFiles/opj_compress.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ../../../bin/opj_compress"
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opj_compress.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/bin/jp2/CMakeFiles/opj_compress.dir/build: bin/opj_compress
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/build

src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/opj_compress.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/convert.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/convertbmp.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/index.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/color.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/__/common/opj_getopt.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/converttif.c.o.requires
src/bin/jp2/CMakeFiles/opj_compress.dir/requires: src/bin/jp2/CMakeFiles/opj_compress.dir/convertpng.c.o.requires
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/requires

src/bin/jp2/CMakeFiles/opj_compress.dir/clean:
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 && $(CMAKE_COMMAND) -P CMakeFiles/opj_compress.dir/cmake_clean.cmake
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/clean

src/bin/jp2/CMakeFiles/opj_compress.dir/depend:
	cd /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2 /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2 /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2 /home/image_server/lifespan/external_compile_libraries/openjpeg-2.1.2/src/bin/jp2/CMakeFiles/opj_compress.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/bin/jp2/CMakeFiles/opj_compress.dir/depend

