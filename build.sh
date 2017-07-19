
ANDROID_SDK=/a/opt/Android/Sdk
ANDROID_NDK=$ANDROID_SDK/ndk-bundle
# Trusty cmake is 2.8, not supported by event and android
# Can use either android or clion static versions
#ACMAKE=$ANDROID_SDK/cmake/3.6.3155560/bin/cmake
ACMAKE=/opt/clion-stable/bin/cmake/bin/cmake

(mkdir cmake-build-debug; cd cmake-build-debug; $ACMAKE ..; make envoy -j4)
(mkdir cmake-build-pi; cd cmake-build-pi; $ACMAKE  -DCMAKE_TOOLCHAIN_FILE=../pi.cmake ..; make envoy -j4)


# ANDROD_STL=c++_static - error: type 'std::string' (aka 'basic_string<char, char_traits<char>, allocator<char> >') does not provide a subscript operator
#    void toLowerCase(std::string& string) const { toLowerCase(&string[0], string.size()); }


# stlport_static:
#  error: no member named 'move' in namespace 'std'

# gnustl_static:  error: no member named 'to_string' in namespace 'std' (mixerclient)

(mkdir cmake-build-android; cd cmake-build-android; $ACMAKE   -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=clang -DANDROID_PLATFORM=android-26 -DANDROID_NDK=$ANDROID_NDK  -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake ..; make envoy)



