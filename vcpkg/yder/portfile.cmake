#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/yder)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/yder
    REF 64e5dff655b6885c4717479244735ebcca02203e
    SHA512 dcf38a77a9d44455e90887e60fc974aee2db4ac8fed0ccf61741374bc9b50bb164afbb48874b4b7d2f4e4b6d051226c78521bc0dcb0a5d2804da70a241860bce
    HEAD_REF master)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/yder-cfg.h
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/yder)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/yder)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/yder/LICENSE ${CURRENT_PACKAGES_DIR}/share/yder/copyright)