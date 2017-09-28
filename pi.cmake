SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# GCC 4.8.3
#SET(CMAKE_C_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-gcc)
#SET(CMAKE_CXX_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++)

# GCC 4.9.3
SET(CMAKE_C_COMPILER ${CMAKE_SOURCE_DIR}/prebuilts/linux-x86/pi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER ${CMAKE_SOURCE_DIR}/prebuilts/linux-x86/pi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-g++)

SET(CMAKE_FIND_ROOT_PATH ${CMAKE_SOURCE_DIR}/prebuilds/linux-x86/pi/tools/rootfs)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DGOOGLE_PROTOBUF_DONT_USE_UNALIGNED=1 ")
set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -DGOOGLE_PROTOBUF_DONT_USE_UNALIGNED=1 ")
