// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: api/protocol.proto

#ifndef PROTOBUF_api_2fprotocol_2eproto__INCLUDED
#define PROTOBUF_api_2fprotocol_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 3003000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 3003002 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_table_driven.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/metadata.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/unknown_field_set.h>
#include <google/protobuf/wrappers.pb.h>
// @@protoc_insertion_point(includes)
namespace envoy {
namespace api {
namespace v2 {
class GrpcProtocolOptions;
class GrpcProtocolOptionsDefaultTypeInternal;
extern GrpcProtocolOptionsDefaultTypeInternal _GrpcProtocolOptions_default_instance_;
class Http1ProtocolOptions;
class Http1ProtocolOptionsDefaultTypeInternal;
extern Http1ProtocolOptionsDefaultTypeInternal _Http1ProtocolOptions_default_instance_;
class Http2ProtocolOptions;
class Http2ProtocolOptionsDefaultTypeInternal;
extern Http2ProtocolOptionsDefaultTypeInternal _Http2ProtocolOptions_default_instance_;
class TcpProtocolOptions;
class TcpProtocolOptionsDefaultTypeInternal;
extern TcpProtocolOptionsDefaultTypeInternal _TcpProtocolOptions_default_instance_;
}  // namespace v2
}  // namespace api
}  // namespace envoy
namespace google {
namespace protobuf {
class BoolValue;
class BoolValueDefaultTypeInternal;
extern BoolValueDefaultTypeInternal _BoolValue_default_instance_;
class BytesValue;
class BytesValueDefaultTypeInternal;
extern BytesValueDefaultTypeInternal _BytesValue_default_instance_;
class DoubleValue;
class DoubleValueDefaultTypeInternal;
extern DoubleValueDefaultTypeInternal _DoubleValue_default_instance_;
class FloatValue;
class FloatValueDefaultTypeInternal;
extern FloatValueDefaultTypeInternal _FloatValue_default_instance_;
class Int32Value;
class Int32ValueDefaultTypeInternal;
extern Int32ValueDefaultTypeInternal _Int32Value_default_instance_;
class Int64Value;
class Int64ValueDefaultTypeInternal;
extern Int64ValueDefaultTypeInternal _Int64Value_default_instance_;
class StringValue;
class StringValueDefaultTypeInternal;
extern StringValueDefaultTypeInternal _StringValue_default_instance_;
class UInt32Value;
class UInt32ValueDefaultTypeInternal;
extern UInt32ValueDefaultTypeInternal _UInt32Value_default_instance_;
class UInt64Value;
class UInt64ValueDefaultTypeInternal;
extern UInt64ValueDefaultTypeInternal _UInt64Value_default_instance_;
}  // namespace protobuf
}  // namespace google

namespace envoy {
namespace api {
namespace v2 {

namespace protobuf_api_2fprotocol_2eproto {
// Internal implementation detail -- do not call these.
struct TableStruct {
  static const ::google::protobuf::internal::ParseTableField entries[];
  static const ::google::protobuf::internal::AuxillaryParseTableField aux[];
  static const ::google::protobuf::internal::ParseTable schema[];
  static const ::google::protobuf::uint32 offsets[];
  static void InitDefaultsImpl();
  static void Shutdown();
};
void AddDescriptors();
void InitDefaults();
}  // namespace protobuf_api_2fprotocol_2eproto

// ===================================================================

class TcpProtocolOptions : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.TcpProtocolOptions) */ {
 public:
  TcpProtocolOptions();
  virtual ~TcpProtocolOptions();

  TcpProtocolOptions(const TcpProtocolOptions& from);

  inline TcpProtocolOptions& operator=(const TcpProtocolOptions& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const TcpProtocolOptions& default_instance();

  static inline const TcpProtocolOptions* internal_default_instance() {
    return reinterpret_cast<const TcpProtocolOptions*>(
               &_TcpProtocolOptions_default_instance_);
  }
  static PROTOBUF_CONSTEXPR int const kIndexInFileMessages =
    0;

  void Swap(TcpProtocolOptions* other);

  // implements Message ----------------------------------------------

  inline TcpProtocolOptions* New() const PROTOBUF_FINAL { return New(NULL); }

  TcpProtocolOptions* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const TcpProtocolOptions& from);
  void MergeFrom(const TcpProtocolOptions& from);
  void Clear() PROTOBUF_FINAL;
  bool IsInitialized() const PROTOBUF_FINAL;

  size_t ByteSizeLong() const PROTOBUF_FINAL;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) PROTOBUF_FINAL;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const PROTOBUF_FINAL;
  int GetCachedSize() const PROTOBUF_FINAL { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const PROTOBUF_FINAL;
  void InternalSwap(TcpProtocolOptions* other);
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

  // @@protoc_insertion_point(class_scope:envoy.api.v2.TcpProtocolOptions)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  mutable int _cached_size_;
  friend struct protobuf_api_2fprotocol_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class Http1ProtocolOptions : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.Http1ProtocolOptions) */ {
 public:
  Http1ProtocolOptions();
  virtual ~Http1ProtocolOptions();

  Http1ProtocolOptions(const Http1ProtocolOptions& from);

  inline Http1ProtocolOptions& operator=(const Http1ProtocolOptions& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const Http1ProtocolOptions& default_instance();

  static inline const Http1ProtocolOptions* internal_default_instance() {
    return reinterpret_cast<const Http1ProtocolOptions*>(
               &_Http1ProtocolOptions_default_instance_);
  }
  static PROTOBUF_CONSTEXPR int const kIndexInFileMessages =
    1;

  void Swap(Http1ProtocolOptions* other);

  // implements Message ----------------------------------------------

  inline Http1ProtocolOptions* New() const PROTOBUF_FINAL { return New(NULL); }

  Http1ProtocolOptions* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const Http1ProtocolOptions& from);
  void MergeFrom(const Http1ProtocolOptions& from);
  void Clear() PROTOBUF_FINAL;
  bool IsInitialized() const PROTOBUF_FINAL;

  size_t ByteSizeLong() const PROTOBUF_FINAL;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) PROTOBUF_FINAL;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const PROTOBUF_FINAL;
  int GetCachedSize() const PROTOBUF_FINAL { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const PROTOBUF_FINAL;
  void InternalSwap(Http1ProtocolOptions* other);
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

  // @@protoc_insertion_point(class_scope:envoy.api.v2.Http1ProtocolOptions)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  mutable int _cached_size_;
  friend struct protobuf_api_2fprotocol_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class Http2ProtocolOptions : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.Http2ProtocolOptions) */ {
 public:
  Http2ProtocolOptions();
  virtual ~Http2ProtocolOptions();

  Http2ProtocolOptions(const Http2ProtocolOptions& from);

  inline Http2ProtocolOptions& operator=(const Http2ProtocolOptions& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const Http2ProtocolOptions& default_instance();

  static inline const Http2ProtocolOptions* internal_default_instance() {
    return reinterpret_cast<const Http2ProtocolOptions*>(
               &_Http2ProtocolOptions_default_instance_);
  }
  static PROTOBUF_CONSTEXPR int const kIndexInFileMessages =
    2;

  void Swap(Http2ProtocolOptions* other);

  // implements Message ----------------------------------------------

  inline Http2ProtocolOptions* New() const PROTOBUF_FINAL { return New(NULL); }

  Http2ProtocolOptions* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const Http2ProtocolOptions& from);
  void MergeFrom(const Http2ProtocolOptions& from);
  void Clear() PROTOBUF_FINAL;
  bool IsInitialized() const PROTOBUF_FINAL;

  size_t ByteSizeLong() const PROTOBUF_FINAL;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) PROTOBUF_FINAL;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const PROTOBUF_FINAL;
  int GetCachedSize() const PROTOBUF_FINAL { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const PROTOBUF_FINAL;
  void InternalSwap(Http2ProtocolOptions* other);
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

  // .google.protobuf.UInt32Value per_stream_buffer_limit_bytes = 1;
  bool has_per_stream_buffer_limit_bytes() const;
  void clear_per_stream_buffer_limit_bytes();
  static const int kPerStreamBufferLimitBytesFieldNumber = 1;
  const ::google::protobuf::UInt32Value& per_stream_buffer_limit_bytes() const;
  ::google::protobuf::UInt32Value* mutable_per_stream_buffer_limit_bytes();
  ::google::protobuf::UInt32Value* release_per_stream_buffer_limit_bytes();
  void set_allocated_per_stream_buffer_limit_bytes(::google::protobuf::UInt32Value* per_stream_buffer_limit_bytes);

  // .google.protobuf.UInt32Value hpack_table_size = 2;
  bool has_hpack_table_size() const;
  void clear_hpack_table_size();
  static const int kHpackTableSizeFieldNumber = 2;
  const ::google::protobuf::UInt32Value& hpack_table_size() const;
  ::google::protobuf::UInt32Value* mutable_hpack_table_size();
  ::google::protobuf::UInt32Value* release_hpack_table_size();
  void set_allocated_hpack_table_size(::google::protobuf::UInt32Value* hpack_table_size);

  // .google.protobuf.UInt32Value max_concurrent_streams = 3;
  bool has_max_concurrent_streams() const;
  void clear_max_concurrent_streams();
  static const int kMaxConcurrentStreamsFieldNumber = 3;
  const ::google::protobuf::UInt32Value& max_concurrent_streams() const;
  ::google::protobuf::UInt32Value* mutable_max_concurrent_streams();
  ::google::protobuf::UInt32Value* release_max_concurrent_streams();
  void set_allocated_max_concurrent_streams(::google::protobuf::UInt32Value* max_concurrent_streams);

  // .google.protobuf.UInt32Value initial_stream_window_size = 4;
  bool has_initial_stream_window_size() const;
  void clear_initial_stream_window_size();
  static const int kInitialStreamWindowSizeFieldNumber = 4;
  const ::google::protobuf::UInt32Value& initial_stream_window_size() const;
  ::google::protobuf::UInt32Value* mutable_initial_stream_window_size();
  ::google::protobuf::UInt32Value* release_initial_stream_window_size();
  void set_allocated_initial_stream_window_size(::google::protobuf::UInt32Value* initial_stream_window_size);

  // .google.protobuf.UInt32Value initial_connection_window_size = 5;
  bool has_initial_connection_window_size() const;
  void clear_initial_connection_window_size();
  static const int kInitialConnectionWindowSizeFieldNumber = 5;
  const ::google::protobuf::UInt32Value& initial_connection_window_size() const;
  ::google::protobuf::UInt32Value* mutable_initial_connection_window_size();
  ::google::protobuf::UInt32Value* release_initial_connection_window_size();
  void set_allocated_initial_connection_window_size(::google::protobuf::UInt32Value* initial_connection_window_size);

  // @@protoc_insertion_point(class_scope:envoy.api.v2.Http2ProtocolOptions)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::UInt32Value* per_stream_buffer_limit_bytes_;
  ::google::protobuf::UInt32Value* hpack_table_size_;
  ::google::protobuf::UInt32Value* max_concurrent_streams_;
  ::google::protobuf::UInt32Value* initial_stream_window_size_;
  ::google::protobuf::UInt32Value* initial_connection_window_size_;
  mutable int _cached_size_;
  friend struct protobuf_api_2fprotocol_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class GrpcProtocolOptions : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.GrpcProtocolOptions) */ {
 public:
  GrpcProtocolOptions();
  virtual ~GrpcProtocolOptions();

  GrpcProtocolOptions(const GrpcProtocolOptions& from);

  inline GrpcProtocolOptions& operator=(const GrpcProtocolOptions& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const GrpcProtocolOptions& default_instance();

  static inline const GrpcProtocolOptions* internal_default_instance() {
    return reinterpret_cast<const GrpcProtocolOptions*>(
               &_GrpcProtocolOptions_default_instance_);
  }
  static PROTOBUF_CONSTEXPR int const kIndexInFileMessages =
    3;

  void Swap(GrpcProtocolOptions* other);

  // implements Message ----------------------------------------------

  inline GrpcProtocolOptions* New() const PROTOBUF_FINAL { return New(NULL); }

  GrpcProtocolOptions* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const GrpcProtocolOptions& from);
  void MergeFrom(const GrpcProtocolOptions& from);
  void Clear() PROTOBUF_FINAL;
  bool IsInitialized() const PROTOBUF_FINAL;

  size_t ByteSizeLong() const PROTOBUF_FINAL;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input) PROTOBUF_FINAL;
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const PROTOBUF_FINAL;
  ::google::protobuf::uint8* InternalSerializeWithCachedSizesToArray(
      bool deterministic, ::google::protobuf::uint8* target) const PROTOBUF_FINAL;
  int GetCachedSize() const PROTOBUF_FINAL { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const PROTOBUF_FINAL;
  void InternalSwap(GrpcProtocolOptions* other);
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

  // .envoy.api.v2.Http2ProtocolOptions http2_protocol_options = 1;
  bool has_http2_protocol_options() const;
  void clear_http2_protocol_options();
  static const int kHttp2ProtocolOptionsFieldNumber = 1;
  const ::envoy::api::v2::Http2ProtocolOptions& http2_protocol_options() const;
  ::envoy::api::v2::Http2ProtocolOptions* mutable_http2_protocol_options();
  ::envoy::api::v2::Http2ProtocolOptions* release_http2_protocol_options();
  void set_allocated_http2_protocol_options(::envoy::api::v2::Http2ProtocolOptions* http2_protocol_options);

  // @@protoc_insertion_point(class_scope:envoy.api.v2.GrpcProtocolOptions)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::envoy::api::v2::Http2ProtocolOptions* http2_protocol_options_;
  mutable int _cached_size_;
  friend struct protobuf_api_2fprotocol_2eproto::TableStruct;
};
// ===================================================================


// ===================================================================

#if !PROTOBUF_INLINE_NOT_IN_HEADERS
// TcpProtocolOptions

// -------------------------------------------------------------------

// Http1ProtocolOptions

// -------------------------------------------------------------------

// Http2ProtocolOptions

// .google.protobuf.UInt32Value per_stream_buffer_limit_bytes = 1;
inline bool Http2ProtocolOptions::has_per_stream_buffer_limit_bytes() const {
  return this != internal_default_instance() && per_stream_buffer_limit_bytes_ != NULL;
}
inline void Http2ProtocolOptions::clear_per_stream_buffer_limit_bytes() {
  if (GetArenaNoVirtual() == NULL && per_stream_buffer_limit_bytes_ != NULL) delete per_stream_buffer_limit_bytes_;
  per_stream_buffer_limit_bytes_ = NULL;
}
inline const ::google::protobuf::UInt32Value& Http2ProtocolOptions::per_stream_buffer_limit_bytes() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.Http2ProtocolOptions.per_stream_buffer_limit_bytes)
  return per_stream_buffer_limit_bytes_ != NULL ? *per_stream_buffer_limit_bytes_
                         : *::google::protobuf::UInt32Value::internal_default_instance();
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::mutable_per_stream_buffer_limit_bytes() {
  
  if (per_stream_buffer_limit_bytes_ == NULL) {
    per_stream_buffer_limit_bytes_ = new ::google::protobuf::UInt32Value;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.Http2ProtocolOptions.per_stream_buffer_limit_bytes)
  return per_stream_buffer_limit_bytes_;
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::release_per_stream_buffer_limit_bytes() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.Http2ProtocolOptions.per_stream_buffer_limit_bytes)
  
  ::google::protobuf::UInt32Value* temp = per_stream_buffer_limit_bytes_;
  per_stream_buffer_limit_bytes_ = NULL;
  return temp;
}
inline void Http2ProtocolOptions::set_allocated_per_stream_buffer_limit_bytes(::google::protobuf::UInt32Value* per_stream_buffer_limit_bytes) {
  delete per_stream_buffer_limit_bytes_;
  if (per_stream_buffer_limit_bytes != NULL && per_stream_buffer_limit_bytes->GetArena() != NULL) {
    ::google::protobuf::UInt32Value* new_per_stream_buffer_limit_bytes = new ::google::protobuf::UInt32Value;
    new_per_stream_buffer_limit_bytes->CopyFrom(*per_stream_buffer_limit_bytes);
    per_stream_buffer_limit_bytes = new_per_stream_buffer_limit_bytes;
  }
  per_stream_buffer_limit_bytes_ = per_stream_buffer_limit_bytes;
  if (per_stream_buffer_limit_bytes) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.Http2ProtocolOptions.per_stream_buffer_limit_bytes)
}

// .google.protobuf.UInt32Value hpack_table_size = 2;
inline bool Http2ProtocolOptions::has_hpack_table_size() const {
  return this != internal_default_instance() && hpack_table_size_ != NULL;
}
inline void Http2ProtocolOptions::clear_hpack_table_size() {
  if (GetArenaNoVirtual() == NULL && hpack_table_size_ != NULL) delete hpack_table_size_;
  hpack_table_size_ = NULL;
}
inline const ::google::protobuf::UInt32Value& Http2ProtocolOptions::hpack_table_size() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.Http2ProtocolOptions.hpack_table_size)
  return hpack_table_size_ != NULL ? *hpack_table_size_
                         : *::google::protobuf::UInt32Value::internal_default_instance();
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::mutable_hpack_table_size() {
  
  if (hpack_table_size_ == NULL) {
    hpack_table_size_ = new ::google::protobuf::UInt32Value;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.Http2ProtocolOptions.hpack_table_size)
  return hpack_table_size_;
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::release_hpack_table_size() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.Http2ProtocolOptions.hpack_table_size)
  
  ::google::protobuf::UInt32Value* temp = hpack_table_size_;
  hpack_table_size_ = NULL;
  return temp;
}
inline void Http2ProtocolOptions::set_allocated_hpack_table_size(::google::protobuf::UInt32Value* hpack_table_size) {
  delete hpack_table_size_;
  if (hpack_table_size != NULL && hpack_table_size->GetArena() != NULL) {
    ::google::protobuf::UInt32Value* new_hpack_table_size = new ::google::protobuf::UInt32Value;
    new_hpack_table_size->CopyFrom(*hpack_table_size);
    hpack_table_size = new_hpack_table_size;
  }
  hpack_table_size_ = hpack_table_size;
  if (hpack_table_size) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.Http2ProtocolOptions.hpack_table_size)
}

// .google.protobuf.UInt32Value max_concurrent_streams = 3;
inline bool Http2ProtocolOptions::has_max_concurrent_streams() const {
  return this != internal_default_instance() && max_concurrent_streams_ != NULL;
}
inline void Http2ProtocolOptions::clear_max_concurrent_streams() {
  if (GetArenaNoVirtual() == NULL && max_concurrent_streams_ != NULL) delete max_concurrent_streams_;
  max_concurrent_streams_ = NULL;
}
inline const ::google::protobuf::UInt32Value& Http2ProtocolOptions::max_concurrent_streams() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.Http2ProtocolOptions.max_concurrent_streams)
  return max_concurrent_streams_ != NULL ? *max_concurrent_streams_
                         : *::google::protobuf::UInt32Value::internal_default_instance();
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::mutable_max_concurrent_streams() {
  
  if (max_concurrent_streams_ == NULL) {
    max_concurrent_streams_ = new ::google::protobuf::UInt32Value;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.Http2ProtocolOptions.max_concurrent_streams)
  return max_concurrent_streams_;
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::release_max_concurrent_streams() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.Http2ProtocolOptions.max_concurrent_streams)
  
  ::google::protobuf::UInt32Value* temp = max_concurrent_streams_;
  max_concurrent_streams_ = NULL;
  return temp;
}
inline void Http2ProtocolOptions::set_allocated_max_concurrent_streams(::google::protobuf::UInt32Value* max_concurrent_streams) {
  delete max_concurrent_streams_;
  if (max_concurrent_streams != NULL && max_concurrent_streams->GetArena() != NULL) {
    ::google::protobuf::UInt32Value* new_max_concurrent_streams = new ::google::protobuf::UInt32Value;
    new_max_concurrent_streams->CopyFrom(*max_concurrent_streams);
    max_concurrent_streams = new_max_concurrent_streams;
  }
  max_concurrent_streams_ = max_concurrent_streams;
  if (max_concurrent_streams) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.Http2ProtocolOptions.max_concurrent_streams)
}

// .google.protobuf.UInt32Value initial_stream_window_size = 4;
inline bool Http2ProtocolOptions::has_initial_stream_window_size() const {
  return this != internal_default_instance() && initial_stream_window_size_ != NULL;
}
inline void Http2ProtocolOptions::clear_initial_stream_window_size() {
  if (GetArenaNoVirtual() == NULL && initial_stream_window_size_ != NULL) delete initial_stream_window_size_;
  initial_stream_window_size_ = NULL;
}
inline const ::google::protobuf::UInt32Value& Http2ProtocolOptions::initial_stream_window_size() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.Http2ProtocolOptions.initial_stream_window_size)
  return initial_stream_window_size_ != NULL ? *initial_stream_window_size_
                         : *::google::protobuf::UInt32Value::internal_default_instance();
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::mutable_initial_stream_window_size() {
  
  if (initial_stream_window_size_ == NULL) {
    initial_stream_window_size_ = new ::google::protobuf::UInt32Value;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.Http2ProtocolOptions.initial_stream_window_size)
  return initial_stream_window_size_;
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::release_initial_stream_window_size() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.Http2ProtocolOptions.initial_stream_window_size)
  
  ::google::protobuf::UInt32Value* temp = initial_stream_window_size_;
  initial_stream_window_size_ = NULL;
  return temp;
}
inline void Http2ProtocolOptions::set_allocated_initial_stream_window_size(::google::protobuf::UInt32Value* initial_stream_window_size) {
  delete initial_stream_window_size_;
  if (initial_stream_window_size != NULL && initial_stream_window_size->GetArena() != NULL) {
    ::google::protobuf::UInt32Value* new_initial_stream_window_size = new ::google::protobuf::UInt32Value;
    new_initial_stream_window_size->CopyFrom(*initial_stream_window_size);
    initial_stream_window_size = new_initial_stream_window_size;
  }
  initial_stream_window_size_ = initial_stream_window_size;
  if (initial_stream_window_size) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.Http2ProtocolOptions.initial_stream_window_size)
}

// .google.protobuf.UInt32Value initial_connection_window_size = 5;
inline bool Http2ProtocolOptions::has_initial_connection_window_size() const {
  return this != internal_default_instance() && initial_connection_window_size_ != NULL;
}
inline void Http2ProtocolOptions::clear_initial_connection_window_size() {
  if (GetArenaNoVirtual() == NULL && initial_connection_window_size_ != NULL) delete initial_connection_window_size_;
  initial_connection_window_size_ = NULL;
}
inline const ::google::protobuf::UInt32Value& Http2ProtocolOptions::initial_connection_window_size() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.Http2ProtocolOptions.initial_connection_window_size)
  return initial_connection_window_size_ != NULL ? *initial_connection_window_size_
                         : *::google::protobuf::UInt32Value::internal_default_instance();
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::mutable_initial_connection_window_size() {
  
  if (initial_connection_window_size_ == NULL) {
    initial_connection_window_size_ = new ::google::protobuf::UInt32Value;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.Http2ProtocolOptions.initial_connection_window_size)
  return initial_connection_window_size_;
}
inline ::google::protobuf::UInt32Value* Http2ProtocolOptions::release_initial_connection_window_size() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.Http2ProtocolOptions.initial_connection_window_size)
  
  ::google::protobuf::UInt32Value* temp = initial_connection_window_size_;
  initial_connection_window_size_ = NULL;
  return temp;
}
inline void Http2ProtocolOptions::set_allocated_initial_connection_window_size(::google::protobuf::UInt32Value* initial_connection_window_size) {
  delete initial_connection_window_size_;
  if (initial_connection_window_size != NULL && initial_connection_window_size->GetArena() != NULL) {
    ::google::protobuf::UInt32Value* new_initial_connection_window_size = new ::google::protobuf::UInt32Value;
    new_initial_connection_window_size->CopyFrom(*initial_connection_window_size);
    initial_connection_window_size = new_initial_connection_window_size;
  }
  initial_connection_window_size_ = initial_connection_window_size;
  if (initial_connection_window_size) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.Http2ProtocolOptions.initial_connection_window_size)
}

// -------------------------------------------------------------------

// GrpcProtocolOptions

// .envoy.api.v2.Http2ProtocolOptions http2_protocol_options = 1;
inline bool GrpcProtocolOptions::has_http2_protocol_options() const {
  return this != internal_default_instance() && http2_protocol_options_ != NULL;
}
inline void GrpcProtocolOptions::clear_http2_protocol_options() {
  if (GetArenaNoVirtual() == NULL && http2_protocol_options_ != NULL) delete http2_protocol_options_;
  http2_protocol_options_ = NULL;
}
inline const ::envoy::api::v2::Http2ProtocolOptions& GrpcProtocolOptions::http2_protocol_options() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.GrpcProtocolOptions.http2_protocol_options)
  return http2_protocol_options_ != NULL ? *http2_protocol_options_
                         : *::envoy::api::v2::Http2ProtocolOptions::internal_default_instance();
}
inline ::envoy::api::v2::Http2ProtocolOptions* GrpcProtocolOptions::mutable_http2_protocol_options() {
  
  if (http2_protocol_options_ == NULL) {
    http2_protocol_options_ = new ::envoy::api::v2::Http2ProtocolOptions;
  }
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.GrpcProtocolOptions.http2_protocol_options)
  return http2_protocol_options_;
}
inline ::envoy::api::v2::Http2ProtocolOptions* GrpcProtocolOptions::release_http2_protocol_options() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.GrpcProtocolOptions.http2_protocol_options)
  
  ::envoy::api::v2::Http2ProtocolOptions* temp = http2_protocol_options_;
  http2_protocol_options_ = NULL;
  return temp;
}
inline void GrpcProtocolOptions::set_allocated_http2_protocol_options(::envoy::api::v2::Http2ProtocolOptions* http2_protocol_options) {
  delete http2_protocol_options_;
  http2_protocol_options_ = http2_protocol_options;
  if (http2_protocol_options) {
    
  } else {
    
  }
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.GrpcProtocolOptions.http2_protocol_options)
}

#endif  // !PROTOBUF_INLINE_NOT_IN_HEADERS
// -------------------------------------------------------------------

// -------------------------------------------------------------------

// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)


}  // namespace v2
}  // namespace api
}  // namespace envoy

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_api_2fprotocol_2eproto__INCLUDED
