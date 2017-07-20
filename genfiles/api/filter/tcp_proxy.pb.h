// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: api/filter/tcp_proxy.proto

#ifndef PROTOBUF_api_2ffilter_2ftcp_5fproxy_2eproto__INCLUDED
#define PROTOBUF_api_2ffilter_2ftcp_5fproxy_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 3002000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 3002000 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/metadata.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/unknown_field_set.h>
#include <google/protobuf/duration.pb.h>
// @@protoc_insertion_point(includes)
namespace envoy {
namespace api {
namespace v2 {
namespace filter {
class TcpProxy;
class TcpProxyDefaultTypeInternal;
extern TcpProxyDefaultTypeInternal _TcpProxy_default_instance_;
}  // namespace filter
}  // namespace v2
}  // namespace api
}  // namespace envoy
namespace google {
namespace protobuf {
class Duration;
class DurationDefaultTypeInternal;
extern DurationDefaultTypeInternal _Duration_default_instance_;
}  // namespace protobuf
}  // namespace google

namespace envoy {
namespace api {
namespace v2 {
namespace filter {

namespace protobuf_api_2ffilter_2ftcp_5fproxy_2eproto {
// Internal implementation detail -- do not call these.
struct TableStruct {
  static const ::google::protobuf::uint32 offsets[];
  static void InitDefaultsImpl();
  static void Shutdown();
};
void AddDescriptors();
void InitDefaults();
}  // namespace protobuf_api_2ffilter_2ftcp_5fproxy_2eproto

// ===================================================================

class TcpProxy : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.filter.TcpProxy) */ {
 public:
  TcpProxy();
  virtual ~TcpProxy();

  TcpProxy(const TcpProxy& from);

  inline TcpProxy& operator=(const TcpProxy& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const TcpProxy& default_instance();

  static inline const TcpProxy* internal_default_instance() {
    return reinterpret_cast<const TcpProxy*>(
               &_TcpProxy_default_instance_);
  }

  void Swap(TcpProxy* other);

  // implements Message ----------------------------------------------

  inline TcpProxy* New() const PROTOBUF_FINAL { return New(NULL); }

  TcpProxy* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const TcpProxy& from);
  void MergeFrom(const TcpProxy& from);
  void Clear() PROTOBUF_FINAL;
  bool IsInitialized() const PROTOBUF_FINAL;

  size_t ByteSizeLong() const PROTOBUF_FINAL;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) PROTOBUF_FINAL;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output)
      const PROTOBUF_FINAL {
    return InternalSerializeWithCachedSizesToArray(
        ::google::protobuf::io::CodedOutputStream::IsDefaultSerializationDeterministic(), output);
  }
  int GetCachedSize() const PROTOBUF_FINAL { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const PROTOBUF_FINAL;
  void InternalSwap(TcpProxy* other);
  private:
  inline ::google::protobuf::Arena* GetArenaNoVirtual() const {
    return NULL;
  }
  inline void* MaybeArenaPtr() const {
    return NULL;
  }
  public:

  ::google::protobuf::Metadata GetMetadata() const PROTOBUF_FINAL;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // string stat_prefix = 1;
  void clear_stat_prefix();
  static const int kStatPrefixFieldNumber = 1;
  const ::std::string& stat_prefix() const;
  void set_stat_prefix(const ::std::string& value);
  #if LANG_CXX11
  void set_stat_prefix(::std::string&& value);
  #endif
  void set_stat_prefix(const char* value);
  void set_stat_prefix(const char* value, size_t size);
  ::std::string* mutable_stat_prefix();
  ::std::string* release_stat_prefix();
  void set_allocated_stat_prefix(::std::string* stat_prefix);

  // string cluster = 2;
  void clear_cluster();
  static const int kClusterFieldNumber = 2;
  const ::std::string& cluster() const;
  void set_cluster(const ::std::string& value);
  #if LANG_CXX11
  void set_cluster(::std::string&& value);
  #endif
  void set_cluster(const char* value);
  void set_cluster(const char* value, size_t size);
  ::std::string* mutable_cluster();
  ::std::string* release_cluster();
  void set_allocated_cluster(::std::string* cluster);

  // .google.protobuf.Duration downstream_idle_timeout = 3;
  bool has_downstream_idle_timeout() const;
  void clear_downstream_idle_timeout();
  static const int kDownstreamIdleTimeoutFieldNumber = 3;
  const ::google::protobuf::Duration& downstream_idle_timeout() const;
  ::google::protobuf::Duration* mutable_downstream_idle_timeout();
  ::google::protobuf::Duration* release_downstream_idle_timeout();
  void set_allocated_downstream_idle_timeout(::google::protobuf::Duration* downstream_idle_timeout);

  // .google.protobuf.Duration upstream_idle_timeout = 4;
  bool has_upstream_idle_timeout() const;
  void clear_upstream_idle_timeout();
  static const int kUpstreamIdleTimeoutFieldNumber = 4;
  const ::google::protobuf::Duration& upstream_idle_timeout() const;
  ::google::protobuf::Duration* mutable_upstream_idle_timeout();
  ::google::protobuf::Duration* release_upstream_idle_timeout();
  void set_allocated_upstream_idle_timeout(::google::protobuf::Duration* upstream_idle_timeout);

  // @@protoc_insertion_point(class_scope:envoy.api.v2.filter.TcpProxy)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::internal::ArenaStringPtr stat_prefix_;
  ::google::protobuf::internal::ArenaStringPtr cluster_;
  ::google::protobuf::Duration* downstream_idle_timeout_;
  ::google::protobuf::Duration* upstream_idle_timeout_;
  mutable int _cached_size_;
  friend struct  protobuf_api_2ffilter_2ftcp_5fproxy_2eproto::TableStruct;
};
// ===================================================================


// ===================================================================

#if !PROTOBUF_INLINE_NOT_IN_HEADERS
// TcpProxy

// string stat_prefix = 1;
inline void TcpProxy::clear_stat_prefix() {
  stat_prefix_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& TcpProxy::stat_prefix() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.TcpProxy.stat_prefix)
  return stat_prefix_.GetNoArena();
}
inline void TcpProxy::set_stat_prefix(const ::std::string& value) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.TcpProxy.stat_prefix)
}
#if LANG_CXX11
inline void TcpProxy::set_stat_prefix(::std::string&& value) {
  
  stat_prefix_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.TcpProxy.stat_prefix)
}
#endif
inline void TcpProxy::set_stat_prefix(const char* value) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.TcpProxy.stat_prefix)
}
inline void TcpProxy::set_stat_prefix(const char* value, size_t size) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.TcpProxy.stat_prefix)
}
inline ::std::string* TcpProxy::mutable_stat_prefix() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.TcpProxy.stat_prefix)
  return stat_prefix_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* TcpProxy::release_stat_prefix() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.TcpProxy.stat_prefix)
  
  return stat_prefix_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void TcpProxy::set_allocated_stat_prefix(::std::string* stat_prefix) {
  if (stat_prefix != NULL) {
    
  } else {
    
  }
  stat_prefix_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), stat_prefix);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.TcpProxy.stat_prefix)
}

// string cluster = 2;
inline void TcpProxy::clear_cluster() {
  cluster_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& TcpProxy::cluster() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.TcpProxy.cluster)
  return cluster_.GetNoArena();
}
inline void TcpProxy::set_cluster(const ::std::string& value) {
  
  cluster_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.TcpProxy.cluster)
}
#if LANG_CXX11
inline void TcpProxy::set_cluster(::std::string&& value) {
  
  cluster_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.TcpProxy.cluster)
}
#endif
inline void TcpProxy::set_cluster(const char* value) {
  
  cluster_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.TcpProxy.cluster)
}
inline void TcpProxy::set_cluster(const char* value, size_t size) {
  
  cluster_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.TcpProxy.cluster)
}
inline ::std::string* TcpProxy::mutable_cluster() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.TcpProxy.cluster)
  return cluster_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* TcpProxy::release_cluster() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.TcpProxy.cluster)
  
  return cluster_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void TcpProxy::set_allocated_cluster(::std::string* cluster) {
  if (cluster != NULL) {
    
  } else {
    
  }
  cluster_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), cluster);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.TcpProxy.cluster)
}

// .google.protobuf.Duration downstream_idle_timeout = 3;
inline bool TcpProxy::has_downstream_idle_timeout() const {
  return this != internal_default_instance() && downstream_idle_timeout_ != NULL;
}
inline void TcpProxy::clear_downstream_idle_timeout() {
  if (GetArenaNoVirtual() == NULL && downstream_idle_timeout_ != NULL) delete downstream_idle_timeout_;
  downstream_idle_timeout_ = NULL;
}
inline const ::google::protobuf::Duration& TcpProxy::downstream_idle_timeout() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.TcpProxy.downstream_idle_timeout)
  return downstream_idle_timeout_ != NULL ? *downstream_idle_timeout_
                         : *::google::protobuf::Duration::internal_default_instance();
}
inline ::google::protobuf::Duration* TcpProxy::mutable_downstream_idle_timeout() {
  
  if (downstream_idle_timeout_ == NULL) {
    downstream_idle_timeout_ = new ::google::protobuf::Duration;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.TcpProxy.downstream_idle_timeout)
  return downstream_idle_timeout_;
}
inline ::google::protobuf::Duration* TcpProxy::release_downstream_idle_timeout() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.TcpProxy.downstream_idle_timeout)
  
  ::google::protobuf::Duration* temp = downstream_idle_timeout_;
  downstream_idle_timeout_ = NULL;
  return temp;
}
inline void TcpProxy::set_allocated_downstream_idle_timeout(::google::protobuf::Duration* downstream_idle_timeout) {
  delete downstream_idle_timeout_;
  if (downstream_idle_timeout != NULL && downstream_idle_timeout->GetArena() != NULL) {
    ::google::protobuf::Duration* new_downstream_idle_timeout = new ::google::protobuf::Duration;
    new_downstream_idle_timeout->CopyFrom(*downstream_idle_timeout);
    downstream_idle_timeout = new_downstream_idle_timeout;
  }
  downstream_idle_timeout_ = downstream_idle_timeout;
  if (downstream_idle_timeout) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.TcpProxy.downstream_idle_timeout)
}

// .google.protobuf.Duration upstream_idle_timeout = 4;
inline bool TcpProxy::has_upstream_idle_timeout() const {
  return this != internal_default_instance() && upstream_idle_timeout_ != NULL;
}
inline void TcpProxy::clear_upstream_idle_timeout() {
  if (GetArenaNoVirtual() == NULL && upstream_idle_timeout_ != NULL) delete upstream_idle_timeout_;
  upstream_idle_timeout_ = NULL;
}
inline const ::google::protobuf::Duration& TcpProxy::upstream_idle_timeout() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.TcpProxy.upstream_idle_timeout)
  return upstream_idle_timeout_ != NULL ? *upstream_idle_timeout_
                         : *::google::protobuf::Duration::internal_default_instance();
}
inline ::google::protobuf::Duration* TcpProxy::mutable_upstream_idle_timeout() {
  
  if (upstream_idle_timeout_ == NULL) {
    upstream_idle_timeout_ = new ::google::protobuf::Duration;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.TcpProxy.upstream_idle_timeout)
  return upstream_idle_timeout_;
}
inline ::google::protobuf::Duration* TcpProxy::release_upstream_idle_timeout() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.TcpProxy.upstream_idle_timeout)
  
  ::google::protobuf::Duration* temp = upstream_idle_timeout_;
  upstream_idle_timeout_ = NULL;
  return temp;
}
inline void TcpProxy::set_allocated_upstream_idle_timeout(::google::protobuf::Duration* upstream_idle_timeout) {
  delete upstream_idle_timeout_;
  if (upstream_idle_timeout != NULL && upstream_idle_timeout->GetArena() != NULL) {
    ::google::protobuf::Duration* new_upstream_idle_timeout = new ::google::protobuf::Duration;
    new_upstream_idle_timeout->CopyFrom(*upstream_idle_timeout);
    upstream_idle_timeout = new_upstream_idle_timeout;
  }
  upstream_idle_timeout_ = upstream_idle_timeout;
  if (upstream_idle_timeout) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.TcpProxy.upstream_idle_timeout)
}

#endif  // !PROTOBUF_INLINE_NOT_IN_HEADERS

// @@protoc_insertion_point(namespace_scope)


}  // namespace filter
}  // namespace v2
}  // namespace api
}  // namespace envoy

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_api_2ffilter_2ftcp_5fproxy_2eproto__INCLUDED
