#header-only library
include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/orcania)

vcpkg_from_github(OUT_SOURCE_PATH SOURCE_PATH
    REPO babelouest/orcania
    REF 99de53ab3006e16c8791392225d1a286d4f61e0a
    SHA512 845941b6f4a480693377e39eff50cbde56908c4f14fbc253ef221899c873ce8940b23de41985dc825d2a1c999ce45db888d274c7be439609bfff23f744738c81
    HEAD_REF 1.3
    PATCHES add-config.patch
            fix-orcania.patch)

# Copy the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/include/*.h)
file(COPY ${HEADER_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/orcania)

# Copy the source files
file(GLOB SRC_FILES ${SOURCE_PATH}/src/*.c)
file(COPY ${SRC_FILES}
     DESTINATION ${CURRENT_PACKAGES_DIR}/include/orcania)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/orcania)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/orcania/LICENSE ${CURRENT_PACKAGES_DIR}/share/orcania/copyright)