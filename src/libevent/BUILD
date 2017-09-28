licenses(["notice"])

cc_library(
    name = "event",
    testonly = 0,
    srcs = [
        "src/buffer.c",
        "src/bufferevent.c",
        "src/bufferevent_filter.c",
        "src/bufferevent_pair.c",
        "src/bufferevent_ratelim.c",
        "src/bufferevent_sock.c",
        "src/event.c",
        "src/evmap.c",
        "src/evthread.c",
        "src/evthread_pthread.c",
        "src/evutil.c",
        "src/epoll.c",
        "src/poll.c",
        "src/select.c",
        "src/evutil_rand.c",
        "src/evutil_time.c",
        "src/listener.c",
        "src/log.c",
        "src/signal.c",
        "src/strlcpy.c",
    ] + glob(["src/*.h"]),
    hdrs = glob(["src/include/event2/*.h"]) + glob([
        "include/event2/*.h",
    ]) + glob(["include/*.h"]) + [
        "src/arc4random.c",
        "src/compat/sys/queue.h",
    ],
    includes = [
        "include",
        "src/compat",
        "src/include",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "event_pthreads",
    testonly = 0,
    visibility = ["//visibility:public"],
)
