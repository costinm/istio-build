

.PHONY: build cmake docker docker-build-images deb gen

build:
	#cd src/proxy; bazel build src/envoy/mixer:envoy
	bazel build @proxy//src/envoy/mixer:envoy
	(cd go/src/istio.io/isto; bazel build //pilot/cmd/pilot-agent:pilot-agent)

deb:
	bazel build @proxy//tools/deb:istio-proxy
	(cd go/src/istio.io/pilot; bazel build tools/deb/...)

BAZEL_TARGET_DIR="bazel-bin/external/proxy/src/envoy/mixer"

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


#### Cross compilation

# Generate files for cmake build.
# Must be called periodically, and before cmake cross targets
gen:
	 ./build/tools/update_gen.sh gen

# Update docker images used in the build.
docker-build-images:
	docker build -t docker.io/costinm/istio-alpine-build build/docker/alpine-build
	docker build -t docker.io/costinm/istio-pi-build build/docker/pi-build
	docker build -t docker.io/costinm/istio-android-build build/docker/android-build

# Experimental cmake target - will build alpine, pi, android binaries
cmake:
	 ./build/tools/build_cmake.sh

