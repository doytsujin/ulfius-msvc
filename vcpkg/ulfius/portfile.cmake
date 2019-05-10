#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/ulfius)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/ulfius
    REF 845546fac730ccbe5862f533ba4d4a17e2489f19
    SHA512 de64d1dd7026179d0457f3b050e6edff50cd1f945b21376c366b6b9501bdc3fc7e2083f2809c7e18e37827c8a802979f4a403cb2e1a11c94e9b8ad8950e4e32c
    HEAD_REF 2.6
    PATCHES add-config.patch)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/ulfius)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/ulfius)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/ulfius/LICENSE ${CURRENT_PACKAGES_DIR}/share/ulfius/copyright)