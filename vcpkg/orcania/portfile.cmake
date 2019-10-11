#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/orcania)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/orcania
    REF 9ed52eeb5419f65350a59542a7eb2532e97c2f84
    SHA512 3acacf5f0fa3dc04b7e38d0fcec861d776da8d3b7c7d0667a79502c4eb3236d42c17095f742d8581b4fcc54030cba5aa13e07ccd5afeb35d8476edff0333ca58
    HEAD_REF master)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/orcania-cfg.h
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/orcania)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/orcania)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/orcania/LICENSE ${CURRENT_PACKAGES_DIR}/share/orcania/copyright)