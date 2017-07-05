
set(LIBEV_SOURCE
        src/libevent/buffer.c
        src/libevent/bufferevent.c
        src/libevent/bufferevent_filter.c
        src/libevent/bufferevent_pair.c
        src/libevent/bufferevent_ratelim.c
        src/libevent/bufferevent_sock.c
        src/libevent/event.c
        src/libevent/evmap.c
        src/libevent/evthread.c
        src/libevent/evthread_pthread.c
        src/libevent/evutil.c
        src/libevent/epoll.c
        src/libevent/poll.c
        src/libevent/select.c
        src/libevent/evutil_rand.c
        src/libevent/evutil_time.c
        src/libevent/listener.c
        src/libevent/log.c
        src/libevent/signal.c
        src/libevent/strlcpy.c
        )
add_library(ev STATIC ${LIBEV_SOURCE})

# Android:
if (ANDROID_TOOLCHAIN STREQUAL gcc)
set_target_properties(ev PROPERTIES COMPILE_FLAGS -DEVENT__HAVE_ARC4RANDOM=1 )
endif()