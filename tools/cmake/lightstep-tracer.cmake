
include_directories(
        ${ISTIO_NATIVE}/lightstep/src/c++11
        ${ISTIO_DEP_GENFILES}/src/lightstep/lightstep-tracer-common
        ${ISTIO_NATIVE}/protobuf/src
)

set(TRACER_SOURCE
        ${ISTIO_DEP_GENFILES}/collector.pb.cc
        ${ISTIO_DEP_GENFILES}/lightstep_carrier.pb.cc

        ${ISTIO_NATIVE}/lightstep/src/c++11/impl.cc
        ${ISTIO_NATIVE}/lightstep/src/c++11/span.cc
        ${ISTIO_NATIVE}/lightstep/src/c++11/tracer.cc
        ${ISTIO_NATIVE}/lightstep/src/c++11/util.cc
        )

add_library(tracer STATIC ${TRACER_SOURCE})
target_compile_definitions(tracer PRIVATE -DPACKAGE_VERSION="2")
