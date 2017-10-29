# Android uses 3.6, clion 3.7.1, trusty 2.8.12
cmake_minimum_required(VERSION 2.8)

project(istio)

set(ISTIO_BASE "" CACHE string "Istio base directory, default to current dir")
set(ISTIO_NATIVE "src" CACHE string "Native source directory")
set(ISTIO_CMAKE "tools/cmake" CACHE string "Custom CMake files")

set(ISTIO_GENFILES "src/proxy/bazel-genfiles" CACHE string "Location of generated files")
# TODO: convince envoy to preserve genfiles.
set(ISTIO_DEP_GENFILES "genfiles" CACHE string "Location of dependency genfiles. Envoy doesn't preserve them.")


# No effect on trusty - must set cxx flag
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11" )

# Envoy uses its own boring ssl crypto, no need for it in libevent
set(EVENT__DISABLE_OPENSSL ON CACHE bool "Disable ssl")
set(EVENT__DISABLE_TESTS ON CACHE bool "disable tests" FORCE)
set(EVENT__DISABLE_SAMPLES ON CACHE bool "disable samples")
set(EVENT__DISABLE_BENCHMARK ON CACHE bool "disable bench")
set(YAML_CPP_BUILD_TOOLS OFF CACHE bool "disable tools" FORCE)
set(protobuf_BUILD_TESTS OFF CACHE bool "dsable tests" FORCE)
set(ZLIB_LIBRARY "" CACHE string "no zlib" FORCE)

# To compile boring ssl - requires go in path
set(GO_EXECUTABLE "go")

# protobuf requires it
add_definitions(-DHAVE_PTHREAD)
# add_definitions(-m64)

#add_definitions(-std=c++11)

# Merged includes for all deps. Generated files are checked in (similar with golang style)

set_property(GLOBAL PROPERTY OPENSSL_ROOT_DIR src/boringssl/src)

# Projects already using cmake
# Doesn't work with CMake 2.8 on trusty
add_subdirectory(src/libevent/src)
add_subdirectory(src/boringssl/src)
add_subdirectory(src/yaml-cpp)
add_subdirectory(src/xxhash/cmake_unofficial)
add_subdirectory(src/protobuf/cmake)

# Packages without cmake support - custom files, similar with the custom bazel
include(${ISTIO_CMAKE}/cares.cmake)
include(tools/cmake/lightstep-tracer.cmake)
include(tools/cmake/http-parser.cmake)
include(tools/cmake/nghttp2.cmake)
include(tools/cmake/istio-mixer.cmake)
include(tools/cmake/grpc_transcoding.cmake)

include(tools/cmake/envoy.cmake)
