cmake_minimum_required(VERSION 3.8)

if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "")
endif()

project(example)

if (NOT MSVC)
  set(THREADS_PREFER_PTHREAD_FLAG ON)
endif()
set(CMAKE_SUPPRESS_REGENERATION ON)
set(CMAKE_C_STANDARD 11)

find_package(Jansson CONFIG REQUIRED)
find_package(CURL REQUIRED)
find_package(ZLIB REQUIRED)
if (MSVC)
  find_package(pthreads CONFIG REQUIRED)
endif()

find_library(MICROHTTPD_LIBRARY libmicrohttpd REQUIRED)

find_path(YDER_INCLUDE_DIR yder.h)
find_path(ORCANIA_INCLUDE_DIR orcania.h)
find_path(ULFIUS_INCLUDE_DIR ulfius.h)

file(GLOB_RECURSE SRC_FILES "src/*.h" "src/*.c")
file(GLOB_RECURSE YDER_SRC_FILES "${YDER_INCLUDE_DIR}/*.c")
file(GLOB_RECURSE ORCANIA_SRC_FILES "${ORCANIA_INCLUDE_DIR}/*.c")
file(GLOB_RECURSE ULFIUS_SRC_FILES "${ULFIUS_INCLUDE_DIR}/*.c")

add_executable(server ${YDER_SRC_FILES} ${ORCANIA_SRC_FILES} ${ULFIUS_SRC_FILES} ${SRC_FILES})

target_include_directories(server PRIVATE ${MICROHTTPD_LIBRARY} ${YDER_INCLUDE_DIR} ${ORCANIA_INCLUDE_DIR} ${ULFIUS_INCLUDE_DIR} ${CURL_INCLUDE_DIRS})

if (MSVC)
  target_link_libraries(server PRIVATE crypt32 wsock32 ws2_32 pthreads)
endif()

target_link_libraries(server PRIVATE ${MICROHTTPD_LIBRARY} ${CURL_LIBRARIES} jansson ZLIB::ZLIB)
