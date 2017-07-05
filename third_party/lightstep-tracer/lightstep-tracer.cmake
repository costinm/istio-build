# tracer
include_directories(
        third_party/lightstep-tracer
)

set(TRACER_SOURCE
        third_party/lightstep-tracer/collector.pb.cc
        third_party/lightstep-tracer/lightstep_carrier.pb.cc

        src/lightstep-tracer/src/c++11/impl.cc
        # grpc req. src/lightstep-tracer/src/c++11/recorder.cc
        src/lightstep-tracer/src/c++11/span.cc
        src/lightstep-tracer/src/c++11/tracer.cc
        src/lightstep-tracer/src/c++11/util.cc
        )


add_library(tracer STATIC ${TRACER_SOURCE})
target_compile_definitions(tracer PRIVATE -DPACKAGE_VERSION="2")
