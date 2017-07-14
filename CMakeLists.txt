# Android uses 3.6, clion 3.7.1, trusty 2.8.12
cmake_minimum_required(VERSION 2.8)

project(istio)

# No effect on trusty - must set cxx flag
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11" )

# Envoy uses its own boring ssl crypto, no need for it in libevent
set(EVENT__DISABLE_OPENSSL ON CACHE bool "Disable ssl")
set(EVENT__DISABLE_TESTS ON CACHE bool "disable tests")
set(EVENT__DISABLE_SAMPLES ON CACHE bool "disable samples")
set(EVENT__DISABLE_BENCHMARK ON CACHE bool "disable bench")

# To compile boring ssl - requires go in path
set(GO_EXECUTABLE "go")

# protobuf requires it
add_definitions(-DHAVE_PTHREAD)
# add_definitions(-m64)

#set_target_properties(nghttp2 PROPERTIES COMPILE_FLAGS -DBUILDING_NGHTTP2)
#add_definitions(-std=c++11)

# Merged includes for all deps. Generated files are checked in (similar with golang style)
include_directories(
        envoy/source
        envoy/include
        src/protobuf/src
        src/libevent/compat
        src/libevent/include
        src/cares
        src/boringssl/include
        src/http-parser
        src/nghttp2/lib/includes
        src/rapidjson/include
        # Tracing
        src/lightstep-tracer/src/c++11
        # CLI
        src/tclap/include
        # Backtraces
        src/backward

        third_party/cares
        third_party/envoy/include
        third_party/nghttp2/include
        third_party/libevent/include
        third_party/cares/config_linux
        third_party/external/envoy
        third_party/external/mixerapi_git
        third_party/external/googleapis_git

        src/mixerclient
        src/proxy
)

set_property(GLOBAL PROPERTY OPENSSL_ROOT_DIR src/boringssl)


#include(third_party/libevent/libevent.cmake)
# Doesn't work with CMake 2.8 on trusty
add_subdirectory(src/libevent)

include(third_party/cares/cares.cmake)

include(third_party/lightstep-tracer/lightstep-tracer.cmake)
include(third_party/nghttp2/nghttp2.cmake)

#add_subdirectory(build/boringssl)
add_subdirectory(src/boringssl)

include(third_party/protobuf/protobuf.cmake)

include(third_party/mixer/istio-mixer.cmake)

add_subdirectory(third_party/envoy-istio)

include(third_party/envoy/envoy.cmake)
