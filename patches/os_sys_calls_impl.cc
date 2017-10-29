#include "common/api/os_sys_calls_impl.h"

#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <netinet/in.h>

namespace Envoy {
namespace Api {

int OsSysCallsImpl::bind(int sockfd, const sockaddr* addr, socklen_t addrlen) {
  return ::bind(sockfd, addr, addrlen);
}

int OsSysCallsImpl::open(const std::string& full_path, int flags, int mode) {
  return ::open(full_path.c_str(), flags, mode);
}

int OsSysCallsImpl::close(int fd) { return ::close(fd); }

ssize_t OsSysCallsImpl::write(int fd, const void* buffer, size_t num_bytes) {
  return ::write(fd, buffer, num_bytes);
}

int OsSysCallsImpl::shmOpen(const char* name, int oflag, mode_t mode) {
  return 0;
}

int OsSysCallsImpl::shmUnlink(const char* name) { return 0; }

int OsSysCallsImpl::ftruncate(int fd, off_t length) { return ::ftruncate(fd, length); }

void* OsSysCallsImpl::mmap(void* addr, size_t length, int prot, int flags, int fd, off_t offset) {
  return ::mmap(addr, length, prot, flags, fd, offset);
}

int OsSysCallsImpl::stat(const char* pathname, struct stat* buf) { return ::stat(pathname, buf); }

} // namespace Api
} // namespace Envoy
