# PI


```
 git clone https://github.com/raspberrypi/tools
 cmake -DCMAKE_TOOLCHAIN_FILE=../pi.cmake ..
 - gcc 4.8.3 - behind ubuntu trusty (which is 4.8.4)
 arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/arm-linux-gnueabihf/include/c++/4.8.3

 - gcc 4.9.3
 arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3
/ws/istio-all/envoy/source/common/runtime/runtime_impl.h:87:69: error: no matching function for call to 'min(uint64_t, long unsigned int)'


```

# Android

```
/a/opt/Android/Sdk/cmake/3.6.3155560/bin/cmake -DANDROID_PLATFORM=android-24 -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=gcc -DANDROID_NDK=/a/opt/Android/Sdk/ndk-bundle/  -DCMAKE_TOOLCHAIN_FILE=/a/opt/Android/Sdk/ndk-bundle/build/cmake/android.toolchain.cmake ..

VERBOSE=1 make

Example command:

/a/opt/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-g++
--sysroot=/a/opt/Android/Sdk/ndk-bundle/sysroot
-DANDROID_STL=c++_static -DHAVE_PTHREAD
-I/ws/istio-all/envoy/source -I/ws/istio-all/envoy/include -I/ws/istio-all/src/protobuf/src -I/ws/istio-all/src/spdlog/include
-I/ws/istio-all/src/libevent/compat -I/ws/istio-all/src/libevent/include
-I/ws/istio-all/src/cares -I/ws/istio-all/src/boringssl/include
-I/ws/istio-all/src/http-parser -I/ws/istio-all/src/nghttp2/lib/includes -I/ws/istio-all/src/rapidjson/include -I/ws/istio-all/src/lightstep-tracer/src/c++11 -I/ws/istio-all/src/tclap/include
-I/ws/istio-all/src/backward -I/ws/istio-all/gen/include -I/ws/istio-all/gen/cares -I/ws/istio-all/gen/cares/config_linux -I/ws/istio-all/genfiles/external/envoy -I/ws/istio-all/genfiles/external/mixerapi_git
-I/ws/istio-all/genfiles/external/googleapis_git -I/ws/istio-all/genfiles -I/ws/istio-all/src/mixerclient -I/ws/istio-all/src/proxy
-I/ws/istio-all/genfiles/external/lightstep_common_git
-I/ws/istio-all/gen/envoy
-isystem /a/opt/Android/Sdk/ndk-bundle/sources/cxx-stl/llvm-libc++/include
-isystem /a/opt/Android/Sdk/ndk-bundle/sources/android/support/include
-isystem /a/opt/Android/Sdk/ndk-bundle/sources/cxx-stl/llvm-libc++abi/include
-isystem /a/opt/Android/Sdk/ndk-bundle/sysroot/usr/include/arm-linux-androideabi
-D__ANDROID_API__=14
-g
-DANDROID
-ffunction-sections
-funwind-tables
-fstack-protector-strong
-no-canonical-prefixes
-march=armv7-a
-mfloat-abi=softfp
-mfpu=vfpv3-d16
-mthumb
-Wa,--noexecstack
-Wformat
-Werror=format-security
-std=c++11
-fno-strict-aliasing
-std=gnu++11

-o CMakeFiles/protobuf.dir/src/protobuf/src/google/protobuf/any.pb.cc.o -c /ws/istio-all/src/protobuf/src/google/protobuf/any.pb.cc

```