#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/ulfius)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/ulfius
    REF c75c4b8ad7c3aae99da6bf25bd6bc1dbbe7dfae4
    SHA512 1d0e77a86ee780a2c674bea87cc5abd86c18e5080b036b70a2c94bd8e03fc32a097bcac6eaec45d6d88bc552f0914dcbe8d3d8664cc1ea6fdfcb4c9811c2988d
    HEAD_REF master)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/ulfius-cfg.h
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/ulfius)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/ulfius)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/ulfius/LICENSE ${CURRENT_PACKAGES_DIR}/share/ulfius/copyright)