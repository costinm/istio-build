// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: mixer/v1/report.proto

#ifndef PROTOBUF_mixer_2fv1_2freport_2eproto__INCLUDED
#define PROTOBUF_mixer_2fv1_2freport_2eproto__INCLUDED

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
#include "mixer/v1/attributes.pb.h"
// @@protoc_insertion_point(includes)
namespace istio {
namespace mixer {
namespace v1 {
class Attributes;
class AttributesDefaultTypeInternal;
extern AttributesDefaultTypeInternal _Attributes_default_instance_;
class ReportRequest;
class ReportRequestDefaultTypeInternal;
extern ReportRequestDefaultTypeInternal _ReportRequest_default_instance_;
class ReportResponse;
class ReportResponseDefaultTypeInternal;
extern ReportResponseDefaultTypeInternal _ReportResponse_default_instance_;
class StringMap;
class StringMapDefaultTypeInternal;
extern StringMapDefaultTypeInternal _StringMap_default_instance_;
}  // namespace v1
}  // namespace mixer
}  // namespace istio

namespace istio {
namespace mixer {
namespace v1 {

namespace protobuf_mixer_2fv1_2freport_2eproto {
// Internal implementation detail -- do not call these.
struct TableStruct {
  static const ::google::protobuf::uint32 offsets[];
  static void InitDefaultsImpl();
  static void Shutdown();
};
void AddDescriptors();
void InitDefaults();
}  // namespace protobuf_mixer_2fv1_2freport_2eproto

// ===================================================================

class ReportRequest : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:istio.mixer.v1.ReportRequest) */ {
 public:
  ReportRequest();
  virtual ~ReportRequest();

  ReportRequest(const ReportRequest& from);

  inline ReportRequest& operator=(const ReportRequest& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const ReportRequest& default_instance();

  static inline const ReportRequest* internal_default_instance() {
    return reinterpret_cast<const ReportRequest*>(
               &_ReportRequest_default_instance_);
  }

  void Swap(ReportRequest* other);

  // implements Message ----------------------------------------------

  inline ReportRequest* New() const PROTOBUF_FINAL { return New(NULL); }

  ReportRequest* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const ReportRequest& from);
  void MergeFrom(const ReportRequest& from);
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
  void InternalSwap(ReportRequest* other);
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

  // repeated .istio.mixer.v1.Attributes attributes = 1;
  int attributes_size() const;
  void clear_attributes();
  static const int kAttributesFieldNumber = 1;
  const ::istio::mixer::v1::Attributes& attributes(int index) const;
  ::istio::mixer::v1::Attributes* mutable_attributes(int index);
  ::istio::mixer::v1::Attributes* add_attributes();
  ::google::protobuf::RepeatedPtrField< ::istio::mixer::v1::Attributes >*
      mutable_attributes();
  const ::google::protobuf::RepeatedPtrField< ::istio::mixer::v1::Attributes >&
      attributes() const;

  // repeated string default_words = 2;
  int default_words_size() const;
  void clear_default_words();
  static const int kDefaultWordsFieldNumber = 2;
  const ::std::string& default_words(int index) const;
  ::std::string* mutable_default_words(int index);
  void set_default_words(int index, const ::std::string& value);
  void set_default_words(int index, const char* value);
  void set_default_words(int index, const char* value, size_t size);
  ::std::string* add_default_words();
  void add_default_words(const ::std::string& value);
  void add_default_words(const char* value);
  void add_default_words(const char* value, size_t size);
  const ::google::protobuf::RepeatedPtrField< ::std::string>& default_words() const;
  ::google::protobuf::RepeatedPtrField< ::std::string>* mutable_default_words();

  // uint32 global_word_count = 3;
  void clear_global_word_count();
  static const int kGlobalWordCountFieldNumber = 3;
  ::google::protobuf::uint32 global_word_count() const;
  void set_global_word_count(::google::protobuf::uint32 value);

  // @@protoc_insertion_point(class_scope:istio.mixer.v1.ReportRequest)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  ::google::protobuf::RepeatedPtrField< ::istio::mixer::v1::Attributes > attributes_;
  ::google::protobuf::RepeatedPtrField< ::std::string> default_words_;
  ::google::protobuf::uint32 global_word_count_;
  mutable int _cached_size_;
  friend struct  protobuf_mixer_2fv1_2freport_2eproto::TableStruct;
};
// -------------------------------------------------------------------

class ReportResponse : public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:istio.mixer.v1.ReportResponse) */ {
 public:
  ReportResponse();
  virtual ~ReportResponse();

  ReportResponse(const ReportResponse& from);

  inline ReportResponse& operator=(const ReportResponse& from) {
    CopyFrom(from);
    return *this;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const ReportResponse& default_instance();

  static inline const ReportResponse* internal_default_instance() {
    return reinterpret_cast<const ReportResponse*>(
               &_ReportResponse_default_instance_);
  }

  void Swap(ReportResponse* other);

  // implements Message ----------------------------------------------

  inline ReportResponse* New() const PROTOBUF_FINAL { return New(NULL); }

  ReportResponse* New(::google::protobuf::Arena* arena) const PROTOBUF_FINAL;
  void CopyFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void MergeFrom(const ::google::protobuf::Message& from) PROTOBUF_FINAL;
  void CopyFrom(const ReportResponse& from);
  void MergeFrom(const ReportResponse& from);
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
  void InternalSwap(ReportResponse* other);
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

  // @@protoc_insertion_point(class_scope:istio.mixer.v1.ReportResponse)
 private:

  ::google::protobuf::internal::InternalMetadataWithArena _internal_metadata_;
  mutable int _cached_size_;
  friend struct  protobuf_mixer_2fv1_2freport_2eproto::TableStruct;
};
// ===================================================================


// ===================================================================

#if !PROTOBUF_INLINE_NOT_IN_HEADERS
// ReportRequest

// repeated .istio.mixer.v1.Attributes attributes = 1;
inline int ReportRequest::attributes_size() const {
  return attributes_.size();
}
inline void ReportRequest::clear_attributes() {
  attributes_.Clear();
}
inline const ::istio::mixer::v1::Attributes& ReportRequest::attributes(int index) const {
  // @@protoc_insertion_point(field_get:istio.mixer.v1.ReportRequest.attributes)
  return attributes_.Get(index);
}
inline ::istio::mixer::v1::Attributes* ReportRequest::mutable_attributes(int index) {
  // @@protoc_insertion_point(field_mutable:istio.mixer.v1.ReportRequest.attributes)
  return attributes_.Mutable(index);
}
inline ::istio::mixer::v1::Attributes* ReportRequest::add_attributes() {
  // @@protoc_insertion_point(field_add:istio.mixer.v1.ReportRequest.attributes)
  return attributes_.Add();
}
inline ::google::protobuf::RepeatedPtrField< ::istio::mixer::v1::Attributes >*
ReportRequest::mutable_attributes() {
  // @@protoc_insertion_point(field_mutable_list:istio.mixer.v1.ReportRequest.attributes)
  return &attributes_;
}
inline const ::google::protobuf::RepeatedPtrField< ::istio::mixer::v1::Attributes >&
ReportRequest::attributes() const {
  // @@protoc_insertion_point(field_list:istio.mixer.v1.ReportRequest.attributes)
  return attributes_;
}

// repeated string default_words = 2;
inline int ReportRequest::default_words_size() const {
  return default_words_.size();
}
inline void ReportRequest::clear_default_words() {
  default_words_.Clear();
}
inline const ::std::string& ReportRequest::default_words(int index) const {
  // @@protoc_insertion_point(field_get:istio.mixer.v1.ReportRequest.default_words)
  return default_words_.Get(index);
}
inline ::std::string* ReportRequest::mutable_default_words(int index) {
  // @@protoc_insertion_point(field_mutable:istio.mixer.v1.ReportRequest.default_words)
  return default_words_.Mutable(index);
}
inline void ReportRequest::set_default_words(int index, const ::std::string& value) {
  // @@protoc_insertion_point(field_set:istio.mixer.v1.ReportRequest.default_words)
  default_words_.Mutable(index)->assign(value);
}
inline void ReportRequest::set_default_words(int index, const char* value) {
  default_words_.Mutable(index)->assign(value);
  // @@protoc_insertion_point(field_set_char:istio.mixer.v1.ReportRequest.default_words)
}
inline void ReportRequest::set_default_words(int index, const char* value, size_t size) {
  default_words_.Mutable(index)->assign(
    reinterpret_cast<const char*>(value), size);
  // @@protoc_insertion_point(field_set_pointer:istio.mixer.v1.ReportRequest.default_words)
}
inline ::std::string* ReportRequest::add_default_words() {
  // @@protoc_insertion_point(field_add_mutable:istio.mixer.v1.ReportRequest.default_words)
  return default_words_.Add();
}
inline void ReportRequest::add_default_words(const ::std::string& value) {
  default_words_.Add()->assign(value);
  // @@protoc_insertion_point(field_add:istio.mixer.v1.ReportRequest.default_words)
}
inline void ReportRequest::add_default_words(const char* value) {
  default_words_.Add()->assign(value);
  // @@protoc_insertion_point(field_add_char:istio.mixer.v1.ReportRequest.default_words)
}
inline void ReportRequest::add_default_words(const char* value, size_t size) {
  default_words_.Add()->assign(reinterpret_cast<const char*>(value), size);
  // @@protoc_insertion_point(field_add_pointer:istio.mixer.v1.ReportRequest.default_words)
}
inline const ::google::protobuf::RepeatedPtrField< ::std::string>&
ReportRequest::default_words() const {
  // @@protoc_insertion_point(field_list:istio.mixer.v1.ReportRequest.default_words)
  return default_words_;
}
inline ::google::protobuf::RepeatedPtrField< ::std::string>*
ReportRequest::mutable_default_words() {
  // @@protoc_insertion_point(field_mutable_list:istio.mixer.v1.ReportRequest.default_words)
  return &default_words_;
}

// uint32 global_word_count = 3;
inline void ReportRequest::clear_global_word_count() {
  global_word_count_ = 0u;
}
inline ::google::protobuf::uint32 ReportRequest::global_word_count() const {
  // @@protoc_insertion_point(field_get:istio.mixer.v1.ReportRequest.global_word_count)
  return global_word_count_;
}
inline void ReportRequest::set_global_word_count(::google::protobuf::uint32 value) {
  
  global_word_count_ = value;
  // @@protoc_insertion_point(field_set:istio.mixer.v1.ReportRequest.global_word_count)
}

// -------------------------------------------------------------------

// ReportResponse

#endif  // !PROTOBUF_INLINE_NOT_IN_HEADERS
// -------------------------------------------------------------------


// @@protoc_insertion_point(namespace_scope)


}  // namespace v1
}  // namespace mixer
}  // namespace istio

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_mixer_2fv1_2freport_2eproto__INCLUDED