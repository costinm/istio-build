#!/usr/bin/env bash

WS=${WS:-$(pwd)/../..}
export GOPATH=${GOPATH:-$WS/go}
LOG_DIR=${LOG_DIR:-log/integration}
PILOT=${PILOT:-${GOPATH}/src/istio.io/pilot}

function kill_all() {
  if [[ -f $LOG_DIR/pilot.pid ]] ; then
    kill -9 $(cat $LOG_DIR/pilot.pid)
    kill -9 $(cat $LOG_DIR/mixer.pid)
    kill -9 $(cat $LOG_DIR/envoy.pid)
    kill -9 $(cat $LOG_DIR/test_server.pid)
  fi
}

# Start pilot, envoy and mixer for local integration testing.
function start_all() {
  mkdir -p $LOG_DIR
  POD_NAME=pilot POD_NAMESPACE=default  ${PILOT}/bazel-bin/cmd/pilot-discovery/pilot-discovery discovery -n default --kubeconfig ~/.kube/config &
  echo $! > $LOG_DIR/pilot.pid

  ${GOPATH}/src/istio.io/mixer/bazel-bin/cmd/server/mixs server --configStoreURL=fs:${GOPATH}/src/istio.io/mixer/testdata/configroot -v=2 --logtostderr &
  echo $! > $LOG_DIR/mixer.pid

  ${GOPATH}/src/istio.io/pilot/bazel-bin/test/server/server --port 9999 > $LOG_DIR/test_server.log 2>&1 &
  echo $! > $LOG_DIR/test_server.pid

  # 'lds' disabled, so we can use manual config.
  bazel-bin/src/envoy/mixer/envoy -c tools/deb/test/envoy_local.json --restart-epoch 0 --drain-time-s 2 --parent-shutdown-time-s 3 --service-cluster istio-proxy --service-node sidecar~172.17.0.2~mysvc.~svc.cluster.local &
  echo $! > $LOG_DIR/envoy.pid
}

