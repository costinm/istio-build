DEPOT ?= docker.io/costinm
BAZEL_TARGET_DIR ?= "bazel-bin/external/proxy/src/envoy/mixer"
export TOP = $(shell pwd)
export ISTIO_SRC = ${TOP}

.PHONY: build cmake docker docker-build-images deb gen

build:
	#cd src/proxy; bazel build src/envoy/mixer:envoy
	bazel build @proxy//src/envoy/mixer:envoy
	(cd go/src/istio.io/istio; bazel build pilot/cmd/pilot-agent:pilot-agent)

deb:
	bazel build @proxy//tools/deb:istio-proxy
	(cd go/src/istio.io/pilot; bazel build tools/deb/...)


docker:
	cp src/proxy/tools/deb/istio-iptables.sh ${BAZEL_TARGET_DIR}
	cp src/proxy/tools/deb/istio-start.sh ${BAZEL_TARGET_DIR}
	cp src/proxy/tools/deb/envoy.json ${BAZEL_TARGET_DIR}
	cp src/proxy/docker/proxy-* ${BAZEL_TARGET_DIR}
	cp src/proxy/docker/Dockerfile.* ${BAZEL_TARGET_DIR}/

dep:
	go get -u github.com/golang/dep/cmd/dep
	(cd go/src/stio.io/istio; dep ensure)
	(cd go/src/stio.io/istio; go build pilot/cmd/...)

go:
	(cd go/src/stio.io/istio; go build pilot/cmd/pilot-agent)

### Docker images used for CI

docker-builder:
	docker build -t ${DEPOT}/istio-fpm-build build/docker/fpm
	docker build -t ${DEPOT}/istio-alpine-build build/docker/alpine-build
	docker build -t ${DEPOT}/istio-android-build build/docker/android-build
	docker build -t ${DEPOT}/istio-pi-build build/docker/pi-build
	docker build -t ${DEPOT}/istio-repo-build build/docker/repo-build

docker-builder-push:
	docker push ${DEPOT}/istio-fpm-build
	docker push ${DEPOT}/istio-alpine-build
	docker push ${DEPOT}/istio-android-build
	docker push ${DEPOT}/istio-pi-build
	docker push ${DEPOT}/istio-repo-build

#### Cross compilation



# Generate files for cmake build.
# Must be called periodically, and before cmake cross targets
gen:
	 ./build/contrib/tools/update_gen.sh gen

# Experimental cmake target - will build alpine, pi, android binaries

DBUILD=${TOP}/build/contrib/dbuild.sh


cmake-pi:
	mkdir -p cmake-pi-debug
	${DBUILD} ${DEPOT}/istio-pi-build "cd cmake-pi-debug; cmake -DCMAKE_TOOLCHAIN_FILE=../build/cmake/pi.cmake  -DISTIO_GENFILES=genfiles/bazel .. && make $MFLAGS envoy"

cmake-alpine:
	mkdir -p cmake-alpine-debug
	${DBUILD} ${DEPOT}/istio-alpine-build "cd cmake-alpine-debug; cmake .. -DISTIO_GENFILES=genfiles/bazel -DUSE_MUSL:bool=ON && make -j8 envoy"

ANDROID_CMD="cd cmake-android-debug; /opt/android-sdk/cmake/3.6.4111459/bin/cmake -DISTIO_GENFILES=genfiles/bazel -DANDROID_CPP_FEATURES=rtti -DANDROID_STL=c++_static -DANDROID_TOOLCHAIN=clang -DANDROID_PLATFORM=android-26  -DANDROID_NDK=/opt/android-sdk/ndk-bundle -DCMAKE_TOOLCHAIN_FILE=/opt/android-sdk/ndk-bundle/build/cmake/android.toolchain.cmake .. && make $MFLAGS envoy"

cmake-android:
	mkdir -p cmake-android-debug
	${DBUILD} ${DEPOT}/istio-android-build ${ANDROID_CMD}

CMAKE_MAKE_OPT?=-j 8

cmake-local:
	mkdir -p cmake-build-debug
	(cd cmake-build-debug; cmake ..)
	(cd cmake-build-debug; make envoy ${CMAKE_MAKE_OPT})

cmake:
	 ./build/tools/build_cmake.sh

