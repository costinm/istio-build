include_directories(
       ../spdlog/include
       .
)
add_library(envoy-istio OBJECT
        config.cc
        http_filter.cc
        utils.cc)
