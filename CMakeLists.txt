# Android uses 3.6, clion 3.7.1, trusty 2.8.12
cmake_minimum_required(VERSION 2.8)

project(istio)

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

#set_target_properties(nghttp2 PROPERTIES COMPILE_FLAGS -DBUILDING_NGHTTP2)
#add_definitions(-std=c++11)

# Merged includes for all deps. Generated files are checked in (similar with golang style)
include_directories(
        envoy/include
        genfiles
        go/src/istio.io/proxy
        src/protobuf/src
        src/cares/cares
        src/boringssl/src/include
        src/http-parser/src
        src/nghttp2/src/lib/includes
        src/rapidjson/include
        # Tracing
        src/lightstep/src/c++11
        # CLI
        src/tclap/include
        # Backtraces
        src/backward
        src/grpc_transcoding/src/include

        # DNS
        src/cares

        src/envoy/include
        src/nghttp2/include
        src/libevent/src/compat
        src/libevent/src/include
        src/libevent/include
        src/cares/config_linux
        src/external/envoy
        src/external/mixerapi_git
        src/external/googleapis_git

        src/fmt
        src/xxhash
        src/mixerclient
        src/proxy
        src/yaml-cpp/include
)

set_property(GLOBAL PROPERTY OPENSSL_ROOT_DIR src/boringssl/src)

# Projects already using cmake
# Doesn't work with CMake 2.8 on trusty
add_subdirectory(src/libevent/src)
add_subdirectory(src/boringssl/src)
add_subdirectory(src/yaml-cpp)
add_subdirectory(src/xxhash/cmake_unofficial)
add_subdirectory(src/protobuf/cmake)

# Packages without cmake support - custom files, similar with the custom bazel
include(tools/cmake/cares.cmake)
include(tools/cmake/lightstep-tracer.cmake)
include(tools/cmake/http-parser.cmake)
include(tools/cmake/nghttp2.cmake)
include(tools/cmake/istio-mixer.cmake)

include(tools/cmake/envoy.cmake)
