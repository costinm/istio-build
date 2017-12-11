DEPOT ?= docker.io/costinm
BAZEL_TARGET_DIR ?= "bazel-bin/external/proxy/src/envoy/mixer"
ISTIO_TAG ?= ${USERNAME}
export TOP = $(shell pwd)
export ISTIO_SRC = ${TOP}
export ANDROID_SDK ?= /opt/android-sdk
export NDK ?= ${ANDROID_SDK}/ndk-bundle
# Should match the version installed in the docker image or local disk
ANDROID_CMAKE_VERSION ?= 3.6.4111459

OUT ?= out
DIST ?= ${OUT}/dist

# Examples:
# - build
#    make dist
# - build pi with verbose commands:
#    make pi MFLAGS="VERBOSE=1"

.PHONY: build cmake docker docker-build-images deb gen go cmake-alpine cmake-pi

# Build binaries, ready for local testing
build: go
	#cd src/proxy; bazel build src/envoy/mixer:envoy
	bazel build @proxy//src/envoy/mixer:envoy

# Build deb files
deb:
	bazel build @proxy//tools/deb:istio-proxy ${BAZEL_BUILD_ARGS}
	(cd go/src/istio.io/istio; bazel build pilot/tools/deb/... \
		security/tools/deb/... ${BAZEL_BUILD_ARGS})

# Build docker images - without uploading
docker:
	(cd go/src/istio.io/istio; BUILD_ONLY=true ./mixer/bin/push_docker)
	(cd go/src/istio.io/istio; BUILD_ONLY=true ./pilot/bin/push_docker)

	cp src/proxy/tools/deb/istio-iptables.sh ${BAZEL_TARGET_DIR}
	cp src/proxy/tools/deb/istio-start.sh ${BAZEL_TARGET_DIR}
	cp src/proxy/tools/deb/envoy.json ${BAZEL_TARGET_DIR}
	cp src/proxy/docker/proxy-* ${BAZEL_TARGET_DIR}
	cp src/proxy/docker/Dockerfile.* ${BAZEL_TARGET_DIR}/

# Push images to external registry, for testing in real k8s.
docker-push:
	docker push ${DEPOT}/proxy:lastest

# Update go dependencies.
dep:
	go get -u github.com/golang/dep/cmd/dep
	(cd go/src/stio.io/istio; dep ensure)

# Build only go binaries, using bazel.
go:
	(cd go/src/istio.io/istio; bazel build \
		pilot/cmd/pilot-agent:pilot-agent \
		mixer/cmd/server:mixs \
		mixer/cmd/client:mixc \
		security/cmd/node_agent:node_agent \
        security/cmd/istio_ca:istio_ca \
    )

### Docker images used for CI

docker-builder:
	docker build -t ${DEPOT}/istio-android-build build/contrib/docker/android-build
	docker build -t ${DEPOT}/istio-pi-build build/contrib/docker/pi-build
	docker build -t ${DEPOT}/istio-fpm-build build/contrib/docker/fpm
	docker build -t ${DEPOT}/istio-alpine-build build/contrib/docker/alpine-build
	docker build -t ${DEPOT}/istio-repo-build build/contrib/docker/repo-build

docker-builder-push:
	docker push ${DEPOT}/istio-android-build
	docker push ${DEPOT}/istio-pi-build
	docker push ${DEPOT}/istio-fpm-build
	docker push ${DEPOT}/istio-alpine-build
	docker push ${DEPOT}/istio-repo-build

#### Cross compilation
CMAKE_MAKE_OPT?=-j 8

# Update generated files, currently using the bazel build and manual protoc.
# Must be called, and results uploaded to github.
gen:
	 ./build/contrib/tools/update_gen.sh gen

# Experimental cmake target - will build alpine, pi, android binaries

DBUILD=${TOP}/build/contrib/dbuild.sh


cmake-pi:
	mkdir -p cmake-pi-debug
	${DBUILD} ${DEPOT}/istio-pi-build "cd cmake-pi-debug; cmake -DCMAKE_TOOLCHAIN_FILE=../build/contrib/cmake/pi.toolchain.cmake  -DISTIO_GENFILES=genfiles/bazel .. && make ${MFLAGS} envoy"

cmake-ipi:
	${DBUILD} ${DEPOT}/istio-pi-build "cd cmake-pi-debug; make ${MFLAGS} envoy"

cmake-alpine:
	mkdir -p cmake-alpine-debug
	${DBUILD} ${DEPOT}/istio-alpine-build "cd cmake-alpine-debug; cmake .. -DISTIO_GENFILES=genfiles/bazel -DUSE_MUSL:bool=ON && make -j8 envoy"

cmake-android:
	mkdir -p cmake-android-debug
	${DBUILD} ${DEPOT}/istio-android-build "make android"
	# ./build/contrib/cmake/android.sh

ISTIO_SRC_DIRS=go/src/istio.io/{api,istio} src/{proxy,mixerclient,envoy,envoy-api}
dist:
	mkdir -p ${DIST}/
	mkdir -p ${DIST}/bin/android && \
	    cp ${TOP}/cmake-android-debug/{envoy,envoy-debug} ${DIST}/bin/android/envoy
	mkdir -p ${DIST}/bin/alpine && \
	    cp ${TOP}/cmake-alpine-debug/envoy ${DIST}/bin/alpine/envoy
	mkdir -p ${DIST}/bin/pi && \
	    cp ${TOP}/cmake-pi-debug/envoy ${DIST}/bin/pi/envoy
	repo manifest -o ${DIST}/repo.xml
	# Native and go dependencies
	tar cfz ${DIST}/istio_src_all.tgz src go build WORKSPACE CMakeLists.txt Makefile
	tar cfz ${DIST}/istio_src.tgz ${ISTIO_SRC_DIRS}
	tar cfz ${DIST}/istio_src_deps_native.tgz src --exclude ${ISTIO_SRC_DIRS}
	tar cfz ${DIST}/istio_src_vendor.tgz go/src/istio.io/istio/vendor


android:
	mkdir -p cmake-android-debug; \
	cd cmake-android-debug; \
	${ANDROID_SDK}/cmake/${ANDROID_CMAKE_VERSION}/bin/cmake \
     -buildDISTIO_GENFILES=genfiles/bazel \
     -DANDROID_CPP_FEATURES=rtti \
     -DANDROID_STL=c++_static \
     -DANDROID_TOOLCHAIN=clang \
     -DANDROID_PLATFORM=android-26  \
     -DANDROID_NDK=/opt/android-sdk/ndk-bundle \
     -DCMAKE_TOOLCHAIN_FILE=${NDK}/build/cmake/android.toolchain.cmake \
     .. && \
    make ${MFLAGS} envoy && \
    cp envoy envoy-debug && \
    ${NDK}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-strip envoy


cmake-local:
	mkdir -p cmake-build-debug
	(cd cmake-build-debug; cmake ..)
	(cd cmake-build-debug; make envoy ${CMAKE_MAKE_OPT})

run-envoy-docker:
	 docker run --rm -it --entrypoint /bin/bash \
	   -v ${TOP}/src/proxy/tools/deb/istio-start.sh:/usr/local/bin/istio-start.sh \
	   -v ${TOP}/src/proxy/tools/deb/envoy.json:/var/lib/istio/envoy.json  \
	   --cap-add=NET_ADMIN  -p 15000:15000 gcr.io/istio-testing/envoy-debug:${ISTIO_TAG}
