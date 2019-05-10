#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/yder)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/yder
    REF dadb50c0d7e971cc4bd20301089350a114ac2102
    SHA512 a4268699899f1647074e1fbea1c74170d36f2893ca0c1ad0f62613ed03c3d885a2f83db0ee0e98091ab004f0806efbbf4a7e9299fe13cfd2fe4c24fed15a6074
    HEAD_REF master
    PATCHES add-config.patch)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/yder)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/yder)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/yder/LICENSE ${CURRENT_PACKAGES_DIR}/share/yder/copyright)