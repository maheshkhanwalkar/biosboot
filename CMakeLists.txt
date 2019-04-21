cmake_minimum_required(VERSION 3.14)
project(biosboot)

enable_language(C CXX ASM)

set(CMAKE_ASM_FLAGS "-m32")

add_executable(stage1 src/stage1/boot.S)

set(CMAKE_VERBOSE_MAKEFILE 1)

set_property(TARGET stage1 APPEND_STRING PROPERTY LINK_FLAGS
        "-Wl,--oformat=binary -Wl,-Ttext=0x7c00 -Wl,--build-id=none -nostartfiles -nostdlib -m32")