// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: api/filter/rate_limit.proto

#ifndef PROTOBUF_api_2ffilter_2frate_5flimit_2eproto__INCLUDED
#define PROTOBUF_api_2ffilter_2frate_5flimit_2eproto__INCLUDED

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
// @@protoc_insertion_point(includes)
namespace envoy {
namespace api {
namespace v2 {
namespace filter {
class RateLimit;
class RateLimitDefaultTypeInternal;
extern RateLimitDefaultTypeInternal _RateLimit_default_instance_;
class RateLimit_RateLimitDescriptor;
class RateLimit_RateLimitDescriptorDefaultTypeInternal;
extern RateLimit_RateLimitDescriptorDefaultTypeInternal _RateLimit_RateLimitDescriptor_default_instance_;
class RateLimit_RateLimitDescriptor_Entry;
class RateLimit_RateLimitDescriptor_EntryDefaultTypeInternal;
extern RateLimit_RateLimitDescriptor_EntryDefaultTypeInternal _RateLimit_RateLimitDescriptor_Entry_default_instance_;
}  // namespace filter
}  // namespace v2
}  // namespace api
}  // namespace envoy

namespace envoy {
namespace api {
namespace v2 {
namespace filter {

namespace protobuf_api_2ffilter_2frate_5flimit_2eproto {
// Internal implementation detail -- do not call these.
struct TableStruct {
  static const ::google::protobuf::uint32 offsets[];
  static void InitDefaultsImpl();
  static void Shutdown();
};
void AddDescriptors();
void InitDefaults();
}  // namespace protobuf_api_2ffilter_2frate_5flimit_2eproto

// ===================================================================

class RateLimit_RateLimitDescriptor_Entry : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry) */ {
 public:
  RateLimit_RateLimitDescriptor_Entry();
  virtual ~RateLimit_RateLimitDescriptor_Entry();

  RateLimit_RateLimitDescriptor_Entry(const RateLimit_RateLimitDescriptor_Entry& from);

  inline RateLimit_RateLimitDescriptor_Entry& operator=(const RateLimit_RateLimitDescriptor_Entry& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const RateLimit_RateLimitDescriptor_Entry& default_instance();

  static inline const RateLimit_RateLimitDescriptor_Entry* internal_default_instance() {
    return reinterpret_cast<const RateLimit_RateLimitDescriptor_Entry*>(
               &_RateLimit_RateLimitDescriptor_Entry_default_instance_);
  }

  void Swap(RateLimit_RateLimitDescriptor_Entry* other);

  // implements Message ----------------------------------------------

  inline RateLimit_RateLimitDescriptor_Entry* New() const PROTOBUF_FINAL { return New(NULL); }

  RateLimit_RateLimitDescriptor_Entry* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const RateLimit_RateLimitDescriptor_Entry& from);
  void MergeFrom(const RateLimit_RateLimitDescriptor_Entry& from);
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
  void InternalSwap(RateLimit_RateLimitDescriptor_Entry* other);
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

  // string key = 1;
  void clear_key();
  static const int kKeyFieldNumber = 1;
  const ::std::string& key() const;
  void set_key(const ::std::string& value);
  #if LANG_CXX11
  void set_key(::std::string&& value);
  #endif
  void set_key(const char* value);
  void set_key(const char* value, size_t size);
  ::std::string* mutable_key();
  ::std::string* release_key();
  void set_allocated_key(::std::string* key);

  // string value = 2;
  void clear_value();
  static const int kValueFieldNumber = 2;
  const ::std::string& value() const;
  void set_value(const ::std::string& value);
  #if LANG_CXX11
  void set_value(::std::string&& value);
  #endif
  void set_value(const char* value);
  void set_value(const char* value, size_t size);
  ::std::string* mutable_value();
  ::std::string* release_value();
  void set_allocated_value(::std::string* value);

  // @@protoc_insertion_point(class_scope:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::internal::ArenaStringPtr key_;
  ::google::protobuf::internal::ArenaStringPtr value_;
  mutable int _cached_size_;
  friend struct  protobuf_api_2ffilter_2frate_5flimit_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class RateLimit_RateLimitDescriptor : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.filter.RateLimit.RateLimitDescriptor) */ {
 public:
  RateLimit_RateLimitDescriptor();
  virtual ~RateLimit_RateLimitDescriptor();

  RateLimit_RateLimitDescriptor(const RateLimit_RateLimitDescriptor& from);

  inline RateLimit_RateLimitDescriptor& operator=(const RateLimit_RateLimitDescriptor& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const RateLimit_RateLimitDescriptor& default_instance();

  static inline const RateLimit_RateLimitDescriptor* internal_default_instance() {
    return reinterpret_cast<const RateLimit_RateLimitDescriptor*>(
               &_RateLimit_RateLimitDescriptor_default_instance_);
  }

  void Swap(RateLimit_RateLimitDescriptor* other);

  // implements Message ----------------------------------------------

  inline RateLimit_RateLimitDescriptor* New() const PROTOBUF_FINAL { return New(NULL); }

  RateLimit_RateLimitDescriptor* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const RateLimit_RateLimitDescriptor& from);
  void MergeFrom(const RateLimit_RateLimitDescriptor& from);
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
  void InternalSwap(RateLimit_RateLimitDescriptor* other);
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

  typedef RateLimit_RateLimitDescriptor_Entry Entry;

  // accessors -------------------------------------------------------

  // repeated .envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry entries = 1;
  int entries_size() const;
  void clear_entries();
  static const int kEntriesFieldNumber = 1;
  const ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry& entries(int index) const;
  ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry* mutable_entries(int index);
  ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry* add_entries();
  ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry >*
      mutable_entries();
  const ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry >&
      entries() const;

  // @@protoc_insertion_point(class_scope:envoy.api.v2.filter.RateLimit.RateLimitDescriptor)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry > entries_;
  mutable int _cached_size_;
  friend struct  protobuf_api_2ffilter_2frate_5flimit_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class RateLimit : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:envoy.api.v2.filter.RateLimit) */ {
 public:
  RateLimit();
  virtual ~RateLimit();

  RateLimit(const RateLimit& from);

  inline RateLimit& operator=(const RateLimit& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const RateLimit& default_instance();

  static inline const RateLimit* internal_default_instance() {
    return reinterpret_cast<const RateLimit*>(
               &_RateLimit_default_instance_);
  }

  void Swap(RateLimit* other);

  // implements Message ----------------------------------------------

  inline RateLimit* New() const PROTOBUF_FINAL { return New(NULL); }

  RateLimit* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const RateLimit& from);
  void MergeFrom(const RateLimit& from);
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
  void InternalSwap(RateLimit* other);
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

  typedef RateLimit_RateLimitDescriptor RateLimitDescriptor;

  // accessors -------------------------------------------------------

  // repeated .envoy.api.v2.filter.RateLimit.RateLimitDescriptor rate_limit_descriptors = 3;
  int rate_limit_descriptors_size() const;
  void clear_rate_limit_descriptors();
  static const int kRateLimitDescriptorsFieldNumber = 3;
  const ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor& rate_limit_descriptors(int index) const;
  ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor* mutable_rate_limit_descriptors(int index);
  ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor* add_rate_limit_descriptors();
  ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor >*
      mutable_rate_limit_descriptors();
  const ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor >&
      rate_limit_descriptors() const;

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

  // string domain = 2;
  void clear_domain();
  static const int kDomainFieldNumber = 2;
  const ::std::string& domain() const;
  void set_domain(const ::std::string& value);
  #if LANG_CXX11
  void set_domain(::std::string&& value);
  #endif
  void set_domain(const char* value);
  void set_domain(const char* value, size_t size);
  ::std::string* mutable_domain();
  ::std::string* release_domain();
  void set_allocated_domain(::std::string* domain);

  // @@protoc_insertion_point(class_scope:envoy.api.v2.filter.RateLimit)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor > rate_limit_descriptors_;
  ::google::protobuf::internal::ArenaStringPtr stat_prefix_;
  ::google::protobuf::internal::ArenaStringPtr domain_;
  mutable int _cached_size_;
  friend struct  protobuf_api_2ffilter_2frate_5flimit_2eproto::TableStruct;
};
// ===================================================================


// ===================================================================

#if !PROTOBUF_INLINE_NOT_IN_HEADERS
// RateLimit_RateLimitDescriptor_Entry

// string key = 1;
inline void RateLimit_RateLimitDescriptor_Entry::clear_key() {
  key_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& RateLimit_RateLimitDescriptor_Entry::key() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
  return key_.GetNoArena();
}
inline void RateLimit_RateLimitDescriptor_Entry::set_key(const ::std::string& value) {
  
  key_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
}
#if LANG_CXX11
inline void RateLimit_RateLimitDescriptor_Entry::set_key(::std::string&& value) {
  
  key_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
}
#endif
inline void RateLimit_RateLimitDescriptor_Entry::set_key(const char* value) {
  
  key_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
}
inline void RateLimit_RateLimitDescriptor_Entry::set_key(const char* value, size_t size) {
  
  key_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
}
inline ::std::string* RateLimit_RateLimitDescriptor_Entry::mutable_key() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
  return key_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* RateLimit_RateLimitDescriptor_Entry::release_key() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
  
  return key_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void RateLimit_RateLimitDescriptor_Entry::set_allocated_key(::std::string* key) {
  if (key != NULL) {
    
  } else {
    
  }
  key_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), key);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.key)
}

// string value = 2;
inline void RateLimit_RateLimitDescriptor_Entry::clear_value() {
  value_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& RateLimit_RateLimitDescriptor_Entry::value() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
  return value_.GetNoArena();
}
inline void RateLimit_RateLimitDescriptor_Entry::set_value(const ::std::string& value) {
  
  value_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
}
#if LANG_CXX11
inline void RateLimit_RateLimitDescriptor_Entry::set_value(::std::string&& value) {
  
  value_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
}
#endif
inline void RateLimit_RateLimitDescriptor_Entry::set_value(const char* value) {
  
  value_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
}
inline void RateLimit_RateLimitDescriptor_Entry::set_value(const char* value, size_t size) {
  
  value_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
}
inline ::std::string* RateLimit_RateLimitDescriptor_Entry::mutable_value() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
  return value_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* RateLimit_RateLimitDescriptor_Entry::release_value() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
  
  return value_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void RateLimit_RateLimitDescriptor_Entry::set_allocated_value(::std::string* value) {
  if (value != NULL) {
    
  } else {
    
  }
  value_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry.value)
}

// -------------------------------------------------------------------

// RateLimit_RateLimitDescriptor

// repeated .envoy.api.v2.filter.RateLimit.RateLimitDescriptor.Entry entries = 1;
inline int RateLimit_RateLimitDescriptor::entries_size() const {
  return entries_.size();
}
inline void RateLimit_RateLimitDescriptor::clear_entries() {
  entries_.Clear();
}
inline const ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry& RateLimit_RateLimitDescriptor::entries(int index) const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.entries)
  return entries_.Get(index);
}
inline ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry* RateLimit_RateLimitDescriptor::mutable_entries(int index) {
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.entries)
  return entries_.Mutable(index);
}
inline ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry* RateLimit_RateLimitDescriptor::add_entries() {
  // @@protoc_insertion_point(field_add:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.entries)
  return entries_.Add();
}
inline ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry >*
RateLimit_RateLimitDescriptor::mutable_entries() {
  // @@protoc_insertion_point(field_mutable_list:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.entries)
  return &entries_;
}
inline const ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor_Entry >&
RateLimit_RateLimitDescriptor::entries() const {
  // @@protoc_insertion_point(field_list:envoy.api.v2.filter.RateLimit.RateLimitDescriptor.entries)
  return entries_;
}

// -------------------------------------------------------------------

// RateLimit

// string stat_prefix = 1;
inline void RateLimit::clear_stat_prefix() {
  stat_prefix_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& RateLimit::stat_prefix() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.stat_prefix)
  return stat_prefix_.GetNoArena();
}
inline void RateLimit::set_stat_prefix(const ::std::string& value) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.RateLimit.stat_prefix)
}
#if LANG_CXX11
inline void RateLimit::set_stat_prefix(::std::string&& value) {
  
  stat_prefix_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.RateLimit.stat_prefix)
}
#endif
inline void RateLimit::set_stat_prefix(const char* value) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.RateLimit.stat_prefix)
}
inline void RateLimit::set_stat_prefix(const char* value, size_t size) {
  
  stat_prefix_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.RateLimit.stat_prefix)
}
inline ::std::string* RateLimit::mutable_stat_prefix() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.stat_prefix)
  return stat_prefix_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* RateLimit::release_stat_prefix() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.RateLimit.stat_prefix)
  
  return stat_prefix_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void RateLimit::set_allocated_stat_prefix(::std::string* stat_prefix) {
  if (stat_prefix != NULL) {
    
  } else {
    
  }
  stat_prefix_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), stat_prefix);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.RateLimit.stat_prefix)
}

// string domain = 2;
inline void RateLimit::clear_domain() {
  domain_.ClearToEmptyNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline const ::std::string& RateLimit::domain() const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.domain)
  return domain_.GetNoArena();
}
inline void RateLimit::set_domain(const ::std::string& value) {
  
  domain_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), value);
  // @@protoc_insertion_point(field_set:envoy.api.v2.filter.RateLimit.domain)
}
#if LANG_CXX11
inline void RateLimit::set_domain(::std::string&& value) {
  
  domain_.SetNoArena(
    &::google::protobuf::internal::GetEmptyStringAlreadyInited(), std::move(value));
  // @@protoc_insertion_point(field_set_rvalue:envoy.api.v2.filter.RateLimit.domain)
}
#endif
inline void RateLimit::set_domain(const char* value) {
  
  domain_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), ::std::string(value));
  // @@protoc_insertion_point(field_set_char:envoy.api.v2.filter.RateLimit.domain)
}
inline void RateLimit::set_domain(const char* value, size_t size) {
  
  domain_.SetNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(),
      ::std::string(reinterpret_cast<const char*>(value), size));
  // @@protoc_insertion_point(field_set_pointer:envoy.api.v2.filter.RateLimit.domain)
}
inline ::std::string* RateLimit::mutable_domain() {
  
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.domain)
  return domain_.MutableNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline ::std::string* RateLimit::release_domain() {
  // @@protoc_insertion_point(field_release:envoy.api.v2.filter.RateLimit.domain)
  
  return domain_.ReleaseNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
}
inline void RateLimit::set_allocated_domain(::std::string* domain) {
  if (domain != NULL) {
    
  } else {
    
  }
  domain_.SetAllocatedNoArena(&::google::protobuf::internal::GetEmptyStringAlreadyInited(), domain);
  // @@protoc_insertion_point(field_set_allocated:envoy.api.v2.filter.RateLimit.domain)
}

// repeated .envoy.api.v2.filter.RateLimit.RateLimitDescriptor rate_limit_descriptors = 3;
inline int RateLimit::rate_limit_descriptors_size() const {
  return rate_limit_descriptors_.size();
}
inline void RateLimit::clear_rate_limit_descriptors() {
  rate_limit_descriptors_.Clear();
}
inline const ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor& RateLimit::rate_limit_descriptors(int index) const {
  // @@protoc_insertion_point(field_get:envoy.api.v2.filter.RateLimit.rate_limit_descriptors)
  return rate_limit_descriptors_.Get(index);
}
inline ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor* RateLimit::mutable_rate_limit_descriptors(int index) {
  // @@protoc_insertion_point(field_mutable:envoy.api.v2.filter.RateLimit.rate_limit_descriptors)
  return rate_limit_descriptors_.Mutable(index);
}
inline ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor* RateLimit::add_rate_limit_descriptors() {
  // @@protoc_insertion_point(field_add:envoy.api.v2.filter.RateLimit.rate_limit_descriptors)
  return rate_limit_descriptors_.Add();
}
inline ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor >*
RateLimit::mutable_rate_limit_descriptors() {
  // @@protoc_insertion_point(field_mutable_list:envoy.api.v2.filter.RateLimit.rate_limit_descriptors)
  return &rate_limit_descriptors_;
}
inline const ::google::protobuf::RepeatedPtrField< ::envoy::api::v2::filter::RateLimit_RateLimitDescriptor >&
RateLimit::rate_limit_descriptors() const {
  // @@protoc_insertion_point(field_list:envoy.api.v2.filter.RateLimit.rate_limit_descriptors)
  return rate_limit_descriptors_;
}

#endif  // !PROTOBUF_INLINE_NOT_IN_HEADERS
// -------------------------------------------------------------------

// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)


}  // namespace filter
}  // namespace v2
}  // namespace api
}  // namespace envoy

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_api_2ffilter_2frate_5flimit_2eproto__INCLUDED