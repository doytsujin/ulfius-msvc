cmake_minimum_required(VERSION 3.8.0)

project(app)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")

set(VCPKG_TARGET_ARCHITECTURE x64)
set(THREADS_PREFER_PTHREAD_FLAG ON)
set(CMAKE_SUPPRESS_REGENERATION ON)
set(CMAKE_C_STANDARD 11)

add_definitions(-D_WIN32_WINNT=0x0601)

find_package(pthreads CONFIG REQUIRED)
find_package(Jansson CONFIG REQUIRED)

find_path(YDER_INCLUDE_DIR yder/yder.h)
find_path(ORCANIA_INCLUDE_DIR orcania/orcania.h)
find_path(ULFIUS_INCLUDE_DIR ulfius/ulfius.h)

find_library(MICROHTTPD_LIBRARY libmicrohttpd REQUIRED)

file(GLOB_RECURSE SRC_FILES
  "src/*.h"
  "src/*.c"
)

file(GLOB_RECURSE YDER_SRC_FILES "${YDER_INCLUDE_DIR}/*.c")
file(GLOB_RECURSE ORCANIA_SRC_FILES "${ORCANIA_INCLUDE_DIR}/*.c")
file(GLOB_RECURSE ULFIUS_SRC_FILES "${ULFIUS_INCLUDE_DIR}/*.c")

add_executable(server ${YDER_SRC_FILES} ${ORCANIA_SRC_FILES} ${ULFIUS_SRC_FILES} ${SRC_FILES})

target_include_directories(server PRIVATE ${MICROHTTPD_LIBRARY} ${YDER_INCLUDE_DIR} ${ORCANIA_INCLUDE_DIR} ${ULFIUS_INCLUDE_DIR})

target_link_libraries(server PRIVATE wsock32 ws2_32 jansson ${MICROHTTPD_LIBRARY} pthreads)
