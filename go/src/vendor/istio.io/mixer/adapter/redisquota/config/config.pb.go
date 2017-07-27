// Code generated by protoc-gen-gogo.
// source: adapter/redisquota/config/config.proto
// DO NOT EDIT!

/*
	Package config is a generated protocol buffer package.

	It is generated from these files:
		adapter/redisquota/config/config.proto

	It has these top-level messages:
		Params
*/
package config

import proto "github.com/gogo/protobuf/proto"
import fmt "fmt"
import math "math"
import _ "github.com/gogo/protobuf/types"
import _ "github.com/gogo/protobuf/gogoproto"

import time "time"

import github_com_gogo_protobuf_types "github.com/gogo/protobuf/types"

import strings "strings"
import reflect "reflect"

import io "io"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf
var _ = time.Kitchen

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion2 // please upgrade the proto package

type Params struct {
	// Minimum number of seconds that deduplication is possible for a given operation.
	MinDeduplicationDuration time.Duration `protobuf:"bytes,1,opt,name=min_deduplication_duration,json=minDeduplicationDuration,stdduration" json:"min_deduplication_duration"`
	// Redis network address
	RedisServerUrl string `protobuf:"bytes,2,opt,name=redis_server_url,json=redisServerUrl,proto3" json:"redis_server_url,omitempty"`
	// Network for communicating with redis, i.e., "tcp"
	SocketType string `protobuf:"bytes,3,opt,name=socket_type,json=socketType,proto3" json:"socket_type,omitempty"`
	// Maximum number of idle connections to redis
	ConnectionPoolSize int64 `protobuf:"varint,4,opt,name=connection_pool_size,json=connectionPoolSize,proto3" json:"connection_pool_size,omitempty"`
	// Algorithm for rate-limiting: either fixed-window or rolling-window.
	// The fixed-window approach can allow 2x peak specified rate, whereas the rolling-window doesn't.
	// The rolling-window algorithm's additional precision comes at the cost of increased redis resource usage.
	RateLimitAlgorithm string `protobuf:"bytes,5,opt,name=rate_limit_algorithm,json=rateLimitAlgorithm,proto3" json:"rate_limit_algorithm,omitempty"`
}

func (m *Params) Reset()                    { *m = Params{} }
func (*Params) ProtoMessage()               {}
func (*Params) Descriptor() ([]byte, []int) { return fileDescriptorConfig, []int{0} }

func init() {
	proto.RegisterType((*Params)(nil), "adapter.redisquota.config.Params")
}
func (m *Params) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalTo(dAtA)
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *Params) MarshalTo(dAtA []byte) (int, error) {
	var i int
	_ = i
	var l int
	_ = l
	dAtA[i] = 0xa
	i++
	i = encodeVarintConfig(dAtA, i, uint64(github_com_gogo_protobuf_types.SizeOfStdDuration(m.MinDeduplicationDuration)))
	n1, err := github_com_gogo_protobuf_types.StdDurationMarshalTo(m.MinDeduplicationDuration, dAtA[i:])
	if err != nil {
		return 0, err
	}
	i += n1
	if len(m.RedisServerUrl) > 0 {
		dAtA[i] = 0x12
		i++
		i = encodeVarintConfig(dAtA, i, uint64(len(m.RedisServerUrl)))
		i += copy(dAtA[i:], m.RedisServerUrl)
	}
	if len(m.SocketType) > 0 {
		dAtA[i] = 0x1a
		i++
		i = encodeVarintConfig(dAtA, i, uint64(len(m.SocketType)))
		i += copy(dAtA[i:], m.SocketType)
	}
	if m.ConnectionPoolSize != 0 {
		dAtA[i] = 0x20
		i++
		i = encodeVarintConfig(dAtA, i, uint64(m.ConnectionPoolSize))
	}
	if len(m.RateLimitAlgorithm) > 0 {
		dAtA[i] = 0x2a
		i++
		i = encodeVarintConfig(dAtA, i, uint64(len(m.RateLimitAlgorithm)))
		i += copy(dAtA[i:], m.RateLimitAlgorithm)
	}
	return i, nil
}

func encodeFixed64Config(dAtA []byte, offset int, v uint64) int {
	dAtA[offset] = uint8(v)
	dAtA[offset+1] = uint8(v >> 8)
	dAtA[offset+2] = uint8(v >> 16)
	dAtA[offset+3] = uint8(v >> 24)
	dAtA[offset+4] = uint8(v >> 32)
	dAtA[offset+5] = uint8(v >> 40)
	dAtA[offset+6] = uint8(v >> 48)
	dAtA[offset+7] = uint8(v >> 56)
	return offset + 8
}
func encodeFixed32Config(dAtA []byte, offset int, v uint32) int {
	dAtA[offset] = uint8(v)
	dAtA[offset+1] = uint8(v >> 8)
	dAtA[offset+2] = uint8(v >> 16)
	dAtA[offset+3] = uint8(v >> 24)
	return offset + 4
}
func encodeVarintConfig(dAtA []byte, offset int, v uint64) int {
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return offset + 1
}
func (m *Params) Size() (n int) {
	var l int
	_ = l
	l = github_com_gogo_protobuf_types.SizeOfStdDuration(m.MinDeduplicationDuration)
	n += 1 + l + sovConfig(uint64(l))
	l = len(m.RedisServerUrl)
	if l > 0 {
		n += 1 + l + sovConfig(uint64(l))
	}
	l = len(m.SocketType)
	if l > 0 {
		n += 1 + l + sovConfig(uint64(l))
	}
	if m.ConnectionPoolSize != 0 {
		n += 1 + sovConfig(uint64(m.ConnectionPoolSize))
	}
	l = len(m.RateLimitAlgorithm)
	if l > 0 {
		n += 1 + l + sovConfig(uint64(l))
	}
	return n
}

func sovConfig(x uint64) (n int) {
	for {
		n++
		x >>= 7
		if x == 0 {
			break
		}
	}
	return n
}
func sozConfig(x uint64) (n int) {
	return sovConfig(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (this *Params) String() string {
	if this == nil {
		return "nil"
	}
	s := strings.Join([]string{`&Params{`,
		`MinDeduplicationDuration:` + strings.Replace(strings.Replace(this.MinDeduplicationDuration.String(), "Duration", "google_protobuf.Duration", 1), `&`, ``, 1) + `,`,
		`RedisServerUrl:` + fmt.Sprintf("%v", this.RedisServerUrl) + `,`,
		`SocketType:` + fmt.Sprintf("%v", this.SocketType) + `,`,
		`ConnectionPoolSize:` + fmt.Sprintf("%v", this.ConnectionPoolSize) + `,`,
		`RateLimitAlgorithm:` + fmt.Sprintf("%v", this.RateLimitAlgorithm) + `,`,
		`}`,
	}, "")
	return s
}
func valueToStringConfig(v interface{}) string {
	rv := reflect.ValueOf(v)
	if rv.IsNil() {
		return "nil"
	}
	pv := reflect.Indirect(rv).Interface()
	return fmt.Sprintf("*%v", pv)
}
func (m *Params) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowConfig
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: Params: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: Params: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field MinDeduplicationDuration", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthConfig
			}
			postIndex := iNdEx + msglen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if err := github_com_gogo_protobuf_types.StdDurationUnmarshal(&m.MinDeduplicationDuration, dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field RedisServerUrl", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthConfig
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.RedisServerUrl = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field SocketType", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthConfig
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.SocketType = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 4:
			if wireType != 0 {
				return fmt.Errorf("proto: wrong wireType = %d for field ConnectionPoolSize", wireType)
			}
			m.ConnectionPoolSize = 0
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				m.ConnectionPoolSize |= (int64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
		case 5:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field RateLimitAlgorithm", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= (uint64(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthConfig
			}
			postIndex := iNdEx + intStringLen
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.RateLimitAlgorithm = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipConfig(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthConfig
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipConfig(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowConfig
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
			return iNdEx, nil
		case 1:
			iNdEx += 8
			return iNdEx, nil
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowConfig
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			iNdEx += length
			if length < 0 {
				return 0, ErrInvalidLengthConfig
			}
			return iNdEx, nil
		case 3:
			for {
				var innerWire uint64
				var start int = iNdEx
				for shift := uint(0); ; shift += 7 {
					if shift >= 64 {
						return 0, ErrIntOverflowConfig
					}
					if iNdEx >= l {
						return 0, io.ErrUnexpectedEOF
					}
					b := dAtA[iNdEx]
					iNdEx++
					innerWire |= (uint64(b) & 0x7F) << shift
					if b < 0x80 {
						break
					}
				}
				innerWireType := int(innerWire & 0x7)
				if innerWireType == 4 {
					break
				}
				next, err := skipConfig(dAtA[start:])
				if err != nil {
					return 0, err
				}
				iNdEx = start + next
			}
			return iNdEx, nil
		case 4:
			return iNdEx, nil
		case 5:
			iNdEx += 4
			return iNdEx, nil
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
	}
	panic("unreachable")
}

var (
	ErrInvalidLengthConfig = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowConfig   = fmt.Errorf("proto: integer overflow")
)

func init() { proto.RegisterFile("adapter/redisquota/config/config.proto", fileDescriptorConfig) }

var fileDescriptorConfig = []byte{
	// 357 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x4c, 0x91, 0xb1, 0x4e, 0xeb, 0x30,
	0x14, 0x86, 0xed, 0xf6, 0xde, 0xea, 0xde, 0x54, 0x42, 0x28, 0xea, 0x90, 0x76, 0x70, 0x2b, 0x06,
	0x94, 0x29, 0x41, 0xb0, 0xb0, 0x52, 0x75, 0x64, 0xa8, 0x5a, 0x58, 0x58, 0x2c, 0x37, 0x71, 0x83,
	0x85, 0x93, 0x13, 0x1c, 0x07, 0xa9, 0x9d, 0x78, 0x04, 0x46, 0xc4, 0x13, 0xf0, 0x28, 0x1d, 0x3b,
	0x32, 0x01, 0x09, 0x0b, 0x63, 0x1f, 0x01, 0xd5, 0x69, 0x54, 0xa6, 0x1c, 0xfd, 0xff, 0xf7, 0xff,
	0xe7, 0x28, 0xb6, 0x8e, 0x59, 0xc8, 0x52, 0xcd, 0x95, 0xaf, 0x78, 0x28, 0xb2, 0xfb, 0x1c, 0x34,
	0xf3, 0x03, 0x48, 0xe6, 0x22, 0xda, 0x7d, 0xbc, 0x54, 0x81, 0x06, 0xbb, 0xbb, 0xe3, 0xbc, 0x3d,
	0xe7, 0x55, 0x40, 0x8f, 0x44, 0x00, 0x91, 0xe4, 0xbe, 0x01, 0x67, 0xf9, 0xdc, 0x0f, 0x73, 0xc5,
	0xb4, 0x80, 0xa4, 0x8a, 0xf6, 0x3a, 0x11, 0x44, 0x60, 0x46, 0x7f, 0x3b, 0x55, 0xea, 0xd1, 0x4b,
	0xc3, 0x6a, 0x8d, 0x99, 0x62, 0x71, 0x66, 0x33, 0xab, 0x17, 0x8b, 0x84, 0x86, 0x3c, 0xcc, 0x53,
	0x29, 0x02, 0x93, 0xa5, 0x75, 0x89, 0x83, 0x07, 0xd8, 0x6d, 0x9f, 0x76, 0xbd, 0x6a, 0x8b, 0x57,
	0x6f, 0xf1, 0x46, 0x3b, 0x60, 0xf8, 0x6f, 0xf5, 0xde, 0x47, 0xcf, 0x1f, 0x7d, 0x3c, 0x71, 0x62,
	0x91, 0x8c, 0x7e, 0xb7, 0xd4, 0x8c, 0xed, 0x5a, 0x87, 0xe6, 0x70, 0x9a, 0x71, 0xf5, 0xc0, 0x15,
	0xcd, 0x95, 0x74, 0x1a, 0x03, 0xec, 0xfe, 0x9f, 0x1c, 0x18, 0x7d, 0x6a, 0xe4, 0x6b, 0x25, 0xed,
	0xbe, 0xd5, 0xce, 0x20, 0xb8, 0xe3, 0x9a, 0xea, 0x45, 0xca, 0x9d, 0xa6, 0x81, 0xac, 0x4a, 0xba,
	0x5a, 0xa4, 0xdc, 0x3e, 0xb1, 0x3a, 0x01, 0x24, 0x09, 0x0f, 0xcc, 0x99, 0x29, 0x80, 0xa4, 0x99,
	0x58, 0x72, 0xe7, 0xcf, 0x00, 0xbb, 0xcd, 0x89, 0xbd, 0xf7, 0xc6, 0x00, 0x72, 0x2a, 0x96, 0x26,
	0xa1, 0x98, 0xe6, 0x54, 0x8a, 0x58, 0x68, 0xca, 0x64, 0x04, 0x4a, 0xe8, 0xdb, 0xd8, 0xf9, 0x6b,
	0xba, 0xed, 0xad, 0x77, 0xb9, 0xb5, 0x2e, 0x6a, 0x67, 0x78, 0xbe, 0x2a, 0x08, 0x5a, 0x17, 0x04,
	0xbd, 0x15, 0x04, 0x6d, 0x0a, 0x82, 0x1e, 0x4b, 0x82, 0x5f, 0x4b, 0x82, 0x56, 0x25, 0xc1, 0xeb,
	0x92, 0xe0, 0xcf, 0x92, 0xe0, 0xef, 0x92, 0xa0, 0x4d, 0x49, 0xf0, 0xd3, 0x17, 0x41, 0x37, 0xad,
	0xea, 0x31, 0x66, 0x2d, 0xf3, 0x7f, 0xce, 0x7e, 0x02, 0x00, 0x00, 0xff, 0xff, 0xd2, 0xee, 0xe9,
	0x8f, 0xd8, 0x01, 0x00, 0x00,
}
