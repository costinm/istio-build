# tracer
include_directories(
        src/lightstep/src/c++11
        genfiles/src/lightstep/lightstep-tracer-common
)

set(TRACER_SOURCE
        genfiles/collector.pb.cc
        genfiles/lightstep_carrier.pb.cc

        src/lightstep/src/c++11/impl.cc
        src/lightstep/src/c++11/span.cc
        src/lightstep/src/c++11/tracer.cc
        src/lightstep/src/c++11/util.cc
        )


add_library(tracer STATIC ${TRACER_SOURCE})
target_compile_definitions(tracer PRIVATE -DPACKAGE_VERSION="2")
