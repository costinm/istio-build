# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api/address.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import wrappers_pb2 as google_dot_protobuf_dot_wrappers__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='api/address.proto',
  package='envoy.api.v2',
  syntax='proto3',
  serialized_pb=_b('\n\x11\x61pi/address.proto\x12\x0c\x65nvoy.api.v2\x1a\x1egoogle/protobuf/wrappers.proto\"\x14\n\x04Pipe\x12\x0c\n\x04path\x18\x01 \x01(\t\"\xb7\x03\n\x11UnresolvedAddress\x12:\n\x08resolver\x18\x01 \x01(\x0b\x32(.envoy.api.v2.UnresolvedAddress.Resolver\x12\x45\n\rnamed_address\x18\x02 \x01(\x0b\x32,.envoy.api.v2.UnresolvedAddress.NamedAddressH\x00\x12\"\n\x04pipe\x18\x03 \x01(\x0b\x32\x12.envoy.api.v2.PipeH\x00\x1a\xd5\x01\n\x0cNamedAddress\x12G\n\x08protocol\x18\x01 \x01(\x0e\x32\x35.envoy.api.v2.UnresolvedAddress.NamedAddress.Protocol\x12\x0f\n\x07\x61\x64\x64ress\x18\x02 \x01(\t\x12,\n\x04port\x18\x03 \x01(\x0b\x32\x1c.google.protobuf.UInt32ValueH\x00\x12\x16\n\x0cservice_name\x18\x04 \x01(\tH\x00\"\x13\n\x08Protocol\x12\x07\n\x03TCP\x10\x00\x42\x10\n\x0eport_specifier\x1a\x18\n\x08Resolver\x12\x0c\n\x04name\x18\x01 \x01(\tB\t\n\x07\x61\x64\x64ress\"I\n\x13UnresolvedAddresses\x12\x32\n\taddresses\x18\x01 \x03(\x0b\x32\x1f.envoy.api.v2.UnresolvedAddress\"\xb6\x02\n\x0fResolvedAddress\x12\x45\n\x0esocket_address\x18\x02 \x01(\x0b\x32+.envoy.api.v2.ResolvedAddress.SocketAddressH\x00\x12\"\n\x04pipe\x18\x03 \x01(\x0b\x32\x12.envoy.api.v2.PipeH\x00\x1a\xac\x01\n\rSocketAddress\x12\x46\n\x08protocol\x18\x01 \x01(\x0e\x32\x34.envoy.api.v2.ResolvedAddress.SocketAddress.Protocol\x12\x12\n\nip_address\x18\x02 \x01(\t\x12*\n\x04port\x18\x03 \x01(\x0b\x32\x1c.google.protobuf.UInt32Value\"\x13\n\x08Protocol\x12\x07\n\x03TCP\x10\x00\x42\t\n\x07\x61\x64\x64ress\"E\n\x11ResolvedAddresses\x12\x30\n\taddresses\x18\x01 \x03(\x0b\x32\x1d.envoy.api.v2.ResolvedAddressb\x06proto3')
  ,
  dependencies=[google_dot_protobuf_dot_wrappers__pb2.DESCRIPTOR,])
_sym_db.RegisterFileDescriptor(DESCRIPTOR)



_UNRESOLVEDADDRESS_NAMEDADDRESS_PROTOCOL = _descriptor.EnumDescriptor(
  name='Protocol',
  full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.Protocol',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='TCP', index=0, number=0,
      options=None,
      type=None),
  ],
  containing_type=None,
  options=None,
  serialized_start=455,
  serialized_end=474,
)
_sym_db.RegisterEnumDescriptor(_UNRESOLVEDADDRESS_NAMEDADDRESS_PROTOCOL)

_RESOLVEDADDRESS_SOCKETADDRESS_PROTOCOL = _descriptor.EnumDescriptor(
  name='Protocol',
  full_name='envoy.api.v2.ResolvedAddress.SocketAddress.Protocol',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='TCP', index=0, number=0,
      options=None,
      type=None),
  ],
  containing_type=None,
  options=None,
  serialized_start=455,
  serialized_end=474,
)
_sym_db.RegisterEnumDescriptor(_RESOLVEDADDRESS_SOCKETADDRESS_PROTOCOL)


_PIPE = _descriptor.Descriptor(
  name='Pipe',
  full_name='envoy.api.v2.Pipe',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='path', full_name='envoy.api.v2.Pipe.path', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=67,
  serialized_end=87,
)


_UNRESOLVEDADDRESS_NAMEDADDRESS = _descriptor.Descriptor(
  name='NamedAddress',
  full_name='envoy.api.v2.UnresolvedAddress.NamedAddress',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='protocol', full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.protocol', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='address', full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.address', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='port', full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.port', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='service_name', full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.service_name', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _UNRESOLVEDADDRESS_NAMEDADDRESS_PROTOCOL,
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='port_specifier', full_name='envoy.api.v2.UnresolvedAddress.NamedAddress.port_specifier',
      index=0, containing_type=None, fields=[]),
  ],
  serialized_start=279,
  serialized_end=492,
)

_UNRESOLVEDADDRESS_RESOLVER = _descriptor.Descriptor(
  name='Resolver',
  full_name='envoy.api.v2.UnresolvedAddress.Resolver',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='envoy.api.v2.UnresolvedAddress.Resolver.name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=494,
  serialized_end=518,
)

_UNRESOLVEDADDRESS = _descriptor.Descriptor(
  name='UnresolvedAddress',
  full_name='envoy.api.v2.UnresolvedAddress',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='resolver', full_name='envoy.api.v2.UnresolvedAddress.resolver', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='named_address', full_name='envoy.api.v2.UnresolvedAddress.named_address', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='pipe', full_name='envoy.api.v2.UnresolvedAddress.pipe', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[_UNRESOLVEDADDRESS_NAMEDADDRESS, _UNRESOLVEDADDRESS_RESOLVER, ],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='address', full_name='envoy.api.v2.UnresolvedAddress.address',
      index=0, containing_type=None, fields=[]),
  ],
  serialized_start=90,
  serialized_end=529,
)


_UNRESOLVEDADDRESSES = _descriptor.Descriptor(
  name='UnresolvedAddresses',
  full_name='envoy.api.v2.UnresolvedAddresses',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='addresses', full_name='envoy.api.v2.UnresolvedAddresses.addresses', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=531,
  serialized_end=604,
)


_RESOLVEDADDRESS_SOCKETADDRESS = _descriptor.Descriptor(
  name='SocketAddress',
  full_name='envoy.api.v2.ResolvedAddress.SocketAddress',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='protocol', full_name='envoy.api.v2.ResolvedAddress.SocketAddress.protocol', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='ip_address', full_name='envoy.api.v2.ResolvedAddress.SocketAddress.ip_address', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='port', full_name='envoy.api.v2.ResolvedAddress.SocketAddress.port', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _RESOLVEDADDRESS_SOCKETADDRESS_PROTOCOL,
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=734,
  serialized_end=906,
)

_RESOLVEDADDRESS = _descriptor.Descriptor(
  name='ResolvedAddress',
  full_name='envoy.api.v2.ResolvedAddress',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='socket_address', full_name='envoy.api.v2.ResolvedAddress.socket_address', index=0,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='pipe', full_name='envoy.api.v2.ResolvedAddress.pipe', index=1,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[_RESOLVEDADDRESS_SOCKETADDRESS, ],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='address', full_name='envoy.api.v2.ResolvedAddress.address',
      index=0, containing_type=None, fields=[]),
  ],
  serialized_start=607,
  serialized_end=917,
)


_RESOLVEDADDRESSES = _descriptor.Descriptor(
  name='ResolvedAddresses',
  full_name='envoy.api.v2.ResolvedAddresses',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='addresses', full_name='envoy.api.v2.ResolvedAddresses.addresses', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=919,
  serialized_end=988,
)

_UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['protocol'].enum_type = _UNRESOLVEDADDRESS_NAMEDADDRESS_PROTOCOL
_UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['port'].message_type = google_dot_protobuf_dot_wrappers__pb2._UINT32VALUE
_UNRESOLVEDADDRESS_NAMEDADDRESS.containing_type = _UNRESOLVEDADDRESS
_UNRESOLVEDADDRESS_NAMEDADDRESS_PROTOCOL.containing_type = _UNRESOLVEDADDRESS_NAMEDADDRESS
_UNRESOLVEDADDRESS_NAMEDADDRESS.oneofs_by_name['port_specifier'].fields.append(
  _UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['port'])
_UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['port'].containing_oneof = _UNRESOLVEDADDRESS_NAMEDADDRESS.oneofs_by_name['port_specifier']
_UNRESOLVEDADDRESS_NAMEDADDRESS.oneofs_by_name['port_specifier'].fields.append(
  _UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['service_name'])
_UNRESOLVEDADDRESS_NAMEDADDRESS.fields_by_name['service_name'].containing_oneof = _UNRESOLVEDADDRESS_NAMEDADDRESS.oneofs_by_name['port_specifier']
_UNRESOLVEDADDRESS_RESOLVER.containing_type = _UNRESOLVEDADDRESS
_UNRESOLVEDADDRESS.fields_by_name['resolver'].message_type = _UNRESOLVEDADDRESS_RESOLVER
_UNRESOLVEDADDRESS.fields_by_name['named_address'].message_type = _UNRESOLVEDADDRESS_NAMEDADDRESS
_UNRESOLVEDADDRESS.fields_by_name['pipe'].message_type = _PIPE
_UNRESOLVEDADDRESS.oneofs_by_name['address'].fields.append(
  _UNRESOLVEDADDRESS.fields_by_name['named_address'])
_UNRESOLVEDADDRESS.fields_by_name['named_address'].containing_oneof = _UNRESOLVEDADDRESS.oneofs_by_name['address']
_UNRESOLVEDADDRESS.oneofs_by_name['address'].fields.append(
  _UNRESOLVEDADDRESS.fields_by_name['pipe'])
_UNRESOLVEDADDRESS.fields_by_name['pipe'].containing_oneof = _UNRESOLVEDADDRESS.oneofs_by_name['address']
_UNRESOLVEDADDRESSES.fields_by_name['addresses'].message_type = _UNRESOLVEDADDRESS
_RESOLVEDADDRESS_SOCKETADDRESS.fields_by_name['protocol'].enum_type = _RESOLVEDADDRESS_SOCKETADDRESS_PROTOCOL
_RESOLVEDADDRESS_SOCKETADDRESS.fields_by_name['port'].message_type = google_dot_protobuf_dot_wrappers__pb2._UINT32VALUE
_RESOLVEDADDRESS_SOCKETADDRESS.containing_type = _RESOLVEDADDRESS
_RESOLVEDADDRESS_SOCKETADDRESS_PROTOCOL.containing_type = _RESOLVEDADDRESS_SOCKETADDRESS
_RESOLVEDADDRESS.fields_by_name['socket_address'].message_type = _RESOLVEDADDRESS_SOCKETADDRESS
_RESOLVEDADDRESS.fields_by_name['pipe'].message_type = _PIPE
_RESOLVEDADDRESS.oneofs_by_name['address'].fields.append(
  _RESOLVEDADDRESS.fields_by_name['socket_address'])
_RESOLVEDADDRESS.fields_by_name['socket_address'].containing_oneof = _RESOLVEDADDRESS.oneofs_by_name['address']
_RESOLVEDADDRESS.oneofs_by_name['address'].fields.append(
  _RESOLVEDADDRESS.fields_by_name['pipe'])
_RESOLVEDADDRESS.fields_by_name['pipe'].containing_oneof = _RESOLVEDADDRESS.oneofs_by_name['address']
_RESOLVEDADDRESSES.fields_by_name['addresses'].message_type = _RESOLVEDADDRESS
DESCRIPTOR.message_types_by_name['Pipe'] = _PIPE
DESCRIPTOR.message_types_by_name['UnresolvedAddress'] = _UNRESOLVEDADDRESS
DESCRIPTOR.message_types_by_name['UnresolvedAddresses'] = _UNRESOLVEDADDRESSES
DESCRIPTOR.message_types_by_name['ResolvedAddress'] = _RESOLVEDADDRESS
DESCRIPTOR.message_types_by_name['ResolvedAddresses'] = _RESOLVEDADDRESSES

Pipe = _reflection.GeneratedProtocolMessageType('Pipe', (_message.Message,), dict(
  DESCRIPTOR = _PIPE,
  __module__ = 'api.address_pb2'
  # @@protoc_insertion_point(class_scope:envoy.api.v2.Pipe)
  ))
_sym_db.RegisterMessage(Pipe)

UnresolvedAddress = _reflection.GeneratedProtocolMessageType('UnresolvedAddress', (_message.Message,), dict(

  NamedAddress = _reflection.GeneratedProtocolMessageType('NamedAddress', (_message.Message,), dict(
    DESCRIPTOR = _UNRESOLVEDADDRESS_NAMEDADDRESS,
    __module__ = 'api.address_pb2'
    # @@protoc_insertion_point(class_scope:envoy.api.v2.UnresolvedAddress.NamedAddress)
    ))
  ,

  Resolver = _reflection.GeneratedProtocolMessageType('Resolver', (_message.Message,), dict(
    DESCRIPTOR = _UNRESOLVEDADDRESS_RESOLVER,
    __module__ = 'api.address_pb2'
    # @@protoc_insertion_point(class_scope:envoy.api.v2.UnresolvedAddress.Resolver)
    ))
  ,
  DESCRIPTOR = _UNRESOLVEDADDRESS,
  __module__ = 'api.address_pb2'
  # @@protoc_insertion_point(class_scope:envoy.api.v2.UnresolvedAddress)
  ))
_sym_db.RegisterMessage(UnresolvedAddress)
_sym_db.RegisterMessage(UnresolvedAddress.NamedAddress)
_sym_db.RegisterMessage(UnresolvedAddress.Resolver)

UnresolvedAddresses = _reflection.GeneratedProtocolMessageType('UnresolvedAddresses', (_message.Message,), dict(
  DESCRIPTOR = _UNRESOLVEDADDRESSES,
  __module__ = 'api.address_pb2'
  # @@protoc_insertion_point(class_scope:envoy.api.v2.UnresolvedAddresses)
  ))
_sym_db.RegisterMessage(UnresolvedAddresses)

ResolvedAddress = _reflection.GeneratedProtocolMessageType('ResolvedAddress', (_message.Message,), dict(

  SocketAddress = _reflection.GeneratedProtocolMessageType('SocketAddress', (_message.Message,), dict(
    DESCRIPTOR = _RESOLVEDADDRESS_SOCKETADDRESS,
    __module__ = 'api.address_pb2'
    # @@protoc_insertion_point(class_scope:envoy.api.v2.ResolvedAddress.SocketAddress)
    ))
  ,
  DESCRIPTOR = _RESOLVEDADDRESS,
  __module__ = 'api.address_pb2'
  # @@protoc_insertion_point(class_scope:envoy.api.v2.ResolvedAddress)
  ))
_sym_db.RegisterMessage(ResolvedAddress)
_sym_db.RegisterMessage(ResolvedAddress.SocketAddress)

ResolvedAddresses = _reflection.GeneratedProtocolMessageType('ResolvedAddresses', (_message.Message,), dict(
  DESCRIPTOR = _RESOLVEDADDRESSES,
  __module__ = 'api.address_pb2'
  # @@protoc_insertion_point(class_scope:envoy.api.v2.ResolvedAddresses)
  ))
_sym_db.RegisterMessage(ResolvedAddresses)


# @@protoc_insertion_point(module_scope)