

.PHONY: build cmake docker docker-build-images deb gen

build:
	#cd src/proxy; bazel build src/envoy/mixer:envoy
	bazel build @proxy//src/envoy/mixer:envoy
	(cd go/src/istio.io/istio; bazel build pilot/cmd/pilot-agent:pilot-agent)

deb:
	bazel build @proxy//tools/deb:istio-proxy
	(cd go/src/istio.io/pilot; bazel build tools/deb/...)

BAZEL_TARGET_DIR ?= "bazel-bin/external/proxy/src/envoy/mixer"

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
DEPOT ?= docker.io/costinm

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
	 ./build/tools/update_gen.sh gen

# Experimental cmake target - will build alpine, pi, android binaries
cmake:
	 ./build/tools/build_cmake.sh

