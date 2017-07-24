// Code generated by protoc-gen-go.
// source: proxy/v1/config/l4_fault.proto
// DO NOT EDIT!

package istio_proxy_v1_config

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"
import google_protobuf1 "github.com/golang/protobuf/ptypes/duration"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// (-- Faults can be injected into the connections from downstream by the
// Envoy, for testing the failure recovery capabilities of downstream
// services.  Faults include aborting the connection from downstream
// service, delaying proxying of connection to the destination
// service, and throttling the bandwidth of the connection (either
// end). Bandwidth throttling for failure testing should not be confused
// with the rate limiting policy enforcement provided by the Mixer
// component. L4 fault injection is not supported at the moment. --)
type L4FaultInjection struct {
	// Unlike Http services, we have very little context for raw Tcp|Udp
	// connections. We could throttle bandwidth of the connections (slow down
	// the connection) and/or abruptly reset (terminate) the Tcp connection
	// after it has been established.
	// We first throttle (if set) and then terminate the connection.
	Throttle  *L4FaultInjection_Throttle  `protobuf:"bytes,1,opt,name=throttle" json:"throttle,omitempty"`
	Terminate *L4FaultInjection_Terminate `protobuf:"bytes,2,opt,name=terminate" json:"terminate,omitempty"`
}

func (m *L4FaultInjection) Reset()                    { *m = L4FaultInjection{} }
func (m *L4FaultInjection) String() string            { return proto.CompactTextString(m) }
func (*L4FaultInjection) ProtoMessage()               {}
func (*L4FaultInjection) Descriptor() ([]byte, []int) { return fileDescriptor3, []int{0} }

func (m *L4FaultInjection) GetThrottle() *L4FaultInjection_Throttle {
	if m != nil {
		return m.Throttle
	}
	return nil
}

func (m *L4FaultInjection) GetTerminate() *L4FaultInjection_Terminate {
	if m != nil {
		return m.Terminate
	}
	return nil
}

// Bandwidth throttling for Tcp and Udp connections
type L4FaultInjection_Throttle struct {
	// percentage of connections to throttle.
	Percent float32 `protobuf:"fixed32,1,opt,name=percent" json:"percent,omitempty"`
	// bandwidth limit in "bits" per second between downstream and Envoy
	DownstreamLimitBps int64 `protobuf:"varint,2,opt,name=downstream_limit_bps,json=downstreamLimitBps" json:"downstream_limit_bps,omitempty"`
	// bandwidth limits in "bits" per second between Envoy and upstream
	UpstreamLimitBps int64 `protobuf:"varint,3,opt,name=upstream_limit_bps,json=upstreamLimitBps" json:"upstream_limit_bps,omitempty"`
	// Types that are valid to be assigned to ThrottleAfter:
	//	*L4FaultInjection_Throttle_ThrottleAfterPeriod
	//	*L4FaultInjection_Throttle_ThrottleAfterBytes
	ThrottleAfter isL4FaultInjection_Throttle_ThrottleAfter `protobuf_oneof:"throttle_after"`
	// Stop throttling after the given duration. If not set, the connection
	// will be throttled for its lifetime.
	ThrottleForPeriod *google_protobuf1.Duration `protobuf:"bytes,6,opt,name=throttle_for_period,json=throttleForPeriod" json:"throttle_for_period,omitempty"`
}

func (m *L4FaultInjection_Throttle) Reset()                    { *m = L4FaultInjection_Throttle{} }
func (m *L4FaultInjection_Throttle) String() string            { return proto.CompactTextString(m) }
func (*L4FaultInjection_Throttle) ProtoMessage()               {}
func (*L4FaultInjection_Throttle) Descriptor() ([]byte, []int) { return fileDescriptor3, []int{0, 0} }

type isL4FaultInjection_Throttle_ThrottleAfter interface {
	isL4FaultInjection_Throttle_ThrottleAfter()
}

type L4FaultInjection_Throttle_ThrottleAfterPeriod struct {
	ThrottleAfterPeriod *google_protobuf1.Duration `protobuf:"bytes,4,opt,name=throttle_after_period,json=throttleAfterPeriod,oneof"`
}
type L4FaultInjection_Throttle_ThrottleAfterBytes struct {
	ThrottleAfterBytes float64 `protobuf:"fixed64,5,opt,name=throttle_after_bytes,json=throttleAfterBytes,oneof"`
}

func (*L4FaultInjection_Throttle_ThrottleAfterPeriod) isL4FaultInjection_Throttle_ThrottleAfter() {}
func (*L4FaultInjection_Throttle_ThrottleAfterBytes) isL4FaultInjection_Throttle_ThrottleAfter()  {}

func (m *L4FaultInjection_Throttle) GetThrottleAfter() isL4FaultInjection_Throttle_ThrottleAfter {
	if m != nil {
		return m.ThrottleAfter
	}
	return nil
}

func (m *L4FaultInjection_Throttle) GetPercent() float32 {
	if m != nil {
		return m.Percent
	}
	return 0
}

func (m *L4FaultInjection_Throttle) GetDownstreamLimitBps() int64 {
	if m != nil {
		return m.DownstreamLimitBps
	}
	return 0
}

func (m *L4FaultInjection_Throttle) GetUpstreamLimitBps() int64 {
	if m != nil {
		return m.UpstreamLimitBps
	}
	return 0
}

func (m *L4FaultInjection_Throttle) GetThrottleAfterPeriod() *google_protobuf1.Duration {
	if x, ok := m.GetThrottleAfter().(*L4FaultInjection_Throttle_ThrottleAfterPeriod); ok {
		return x.ThrottleAfterPeriod
	}
	return nil
}

func (m *L4FaultInjection_Throttle) GetThrottleAfterBytes() float64 {
	if x, ok := m.GetThrottleAfter().(*L4FaultInjection_Throttle_ThrottleAfterBytes); ok {
		return x.ThrottleAfterBytes
	}
	return 0
}

func (m *L4FaultInjection_Throttle) GetThrottleForPeriod() *google_protobuf1.Duration {
	if m != nil {
		return m.ThrottleForPeriod
	}
	return nil
}

// XXX_OneofFuncs is for the internal use of the proto package.
func (*L4FaultInjection_Throttle) XXX_OneofFuncs() (func(msg proto.Message, b *proto.Buffer) error, func(msg proto.Message, tag, wire int, b *proto.Buffer) (bool, error), func(msg proto.Message) (n int), []interface{}) {
	return _L4FaultInjection_Throttle_OneofMarshaler, _L4FaultInjection_Throttle_OneofUnmarshaler, _L4FaultInjection_Throttle_OneofSizer, []interface{}{
		(*L4FaultInjection_Throttle_ThrottleAfterPeriod)(nil),
		(*L4FaultInjection_Throttle_ThrottleAfterBytes)(nil),
	}
}

func _L4FaultInjection_Throttle_OneofMarshaler(msg proto.Message, b *proto.Buffer) error {
	m := msg.(*L4FaultInjection_Throttle)
	// throttle_after
	switch x := m.ThrottleAfter.(type) {
	case *L4FaultInjection_Throttle_ThrottleAfterPeriod:
		b.EncodeVarint(4<<3 | proto.WireBytes)
		if err := b.EncodeMessage(x.ThrottleAfterPeriod); err != nil {
			return err
		}
	case *L4FaultInjection_Throttle_ThrottleAfterBytes:
		b.EncodeVarint(5<<3 | proto.WireFixed64)
		b.EncodeFixed64(math.Float64bits(x.ThrottleAfterBytes))
	case nil:
	default:
		return fmt.Errorf("L4FaultInjection_Throttle.ThrottleAfter has unexpected type %T", x)
	}
	return nil
}

func _L4FaultInjection_Throttle_OneofUnmarshaler(msg proto.Message, tag, wire int, b *proto.Buffer) (bool, error) {
	m := msg.(*L4FaultInjection_Throttle)
	switch tag {
	case 4: // throttle_after.throttle_after_period
		if wire != proto.WireBytes {
			return true, proto.ErrInternalBadWireType
		}
		msg := new(google_protobuf1.Duration)
		err := b.DecodeMessage(msg)
		m.ThrottleAfter = &L4FaultInjection_Throttle_ThrottleAfterPeriod{msg}
		return true, err
	case 5: // throttle_after.throttle_after_bytes
		if wire != proto.WireFixed64 {
			return true, proto.ErrInternalBadWireType
		}
		x, err := b.DecodeFixed64()
		m.ThrottleAfter = &L4FaultInjection_Throttle_ThrottleAfterBytes{math.Float64frombits(x)}
		return true, err
	default:
		return false, nil
	}
}

func _L4FaultInjection_Throttle_OneofSizer(msg proto.Message) (n int) {
	m := msg.(*L4FaultInjection_Throttle)
	// throttle_after
	switch x := m.ThrottleAfter.(type) {
	case *L4FaultInjection_Throttle_ThrottleAfterPeriod:
		s := proto.Size(x.ThrottleAfterPeriod)
		n += proto.SizeVarint(4<<3 | proto.WireBytes)
		n += proto.SizeVarint(uint64(s))
		n += s
	case *L4FaultInjection_Throttle_ThrottleAfterBytes:
		n += proto.SizeVarint(5<<3 | proto.WireFixed64)
		n += 8
	case nil:
	default:
		panic(fmt.Sprintf("proto: unexpected type %T in oneof", x))
	}
	return n
}

// Abruptly reset (terminate) the Tcp connection after it has been
// established, emulating remote server crash or link failure.
type L4FaultInjection_Terminate struct {
	// percentage of established Tcp connections to be terminated/reset
	Percent float32 `protobuf:"fixed32,1,opt,name=percent" json:"percent,omitempty"`
	// TODO: see if it makes sense to create a generic Duration type to
	// express time interval related configs.
	TerminateAfterPeriod *google_protobuf1.Duration `protobuf:"bytes,2,opt,name=terminate_after_period,json=terminateAfterPeriod" json:"terminate_after_period,omitempty"`
}

func (m *L4FaultInjection_Terminate) Reset()                    { *m = L4FaultInjection_Terminate{} }
func (m *L4FaultInjection_Terminate) String() string            { return proto.CompactTextString(m) }
func (*L4FaultInjection_Terminate) ProtoMessage()               {}
func (*L4FaultInjection_Terminate) Descriptor() ([]byte, []int) { return fileDescriptor3, []int{0, 1} }

func (m *L4FaultInjection_Terminate) GetPercent() float32 {
	if m != nil {
		return m.Percent
	}
	return 0
}

func (m *L4FaultInjection_Terminate) GetTerminateAfterPeriod() *google_protobuf1.Duration {
	if m != nil {
		return m.TerminateAfterPeriod
	}
	return nil
}

func init() {
	proto.RegisterType((*L4FaultInjection)(nil), "istio.proxy.v1.config.L4FaultInjection")
	proto.RegisterType((*L4FaultInjection_Throttle)(nil), "istio.proxy.v1.config.L4FaultInjection.Throttle")
	proto.RegisterType((*L4FaultInjection_Terminate)(nil), "istio.proxy.v1.config.L4FaultInjection.Terminate")
}

func init() { proto.RegisterFile("proxy/v1/config/l4_fault.proto", fileDescriptor3) }

var fileDescriptor3 = []byte{
	// 362 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x8c, 0x91, 0xc1, 0x4e, 0xf2, 0x40,
	0x14, 0x85, 0x69, 0xf9, 0xe1, 0x87, 0x6b, 0x62, 0x70, 0x04, 0x53, 0x59, 0x10, 0xe2, 0x8a, 0x85,
	0x99, 0x02, 0xf2, 0x02, 0x12, 0x43, 0x20, 0x21, 0xc1, 0x34, 0xee, 0x9b, 0x16, 0xa6, 0x38, 0xa6,
	0x74, 0x9a, 0xe9, 0x2d, 0xca, 0x6b, 0xf8, 0x90, 0x3e, 0x87, 0xe9, 0xc0, 0x14, 0x41, 0x23, 0x2e,
	0x9b, 0x73, 0xbe, 0x73, 0x4f, 0xcf, 0x40, 0x2b, 0x96, 0xe2, 0x6d, 0x63, 0xaf, 0x7b, 0xf6, 0x5c,
	0x44, 0x01, 0x5f, 0xda, 0xe1, 0xc0, 0x0d, 0xbc, 0x34, 0x44, 0x1a, 0x4b, 0x81, 0x82, 0x34, 0x78,
	0x82, 0x5c, 0x50, 0xe5, 0xa2, 0xeb, 0x1e, 0xdd, 0xba, 0x9a, 0xad, 0xa5, 0x10, 0xcb, 0x90, 0xd9,
	0xca, 0xe4, 0xa7, 0x81, 0xbd, 0x48, 0xa5, 0x87, 0x5c, 0x44, 0x5b, 0xec, 0xe6, 0xbd, 0x04, 0xb5,
	0xe9, 0x60, 0x94, 0x05, 0x4d, 0xa2, 0x17, 0x36, 0xcf, 0x24, 0x32, 0x85, 0x0a, 0x3e, 0x4b, 0x81,
	0x18, 0x32, 0xcb, 0x68, 0x1b, 0x9d, 0xb3, 0x7e, 0x97, 0xfe, 0x18, 0x4f, 0x8f, 0x51, 0xfa, 0xb4,
	0xe3, 0x9c, 0x3c, 0x81, 0xcc, 0xa0, 0x8a, 0x4c, 0xae, 0x78, 0xe4, 0x21, 0xb3, 0x4c, 0x15, 0xd7,
	0xfb, 0x73, 0x9c, 0x06, 0x9d, 0x7d, 0x46, 0xf3, 0xc3, 0x84, 0x8a, 0xbe, 0x43, 0x2c, 0xf8, 0x1f,
	0x33, 0x39, 0x67, 0x11, 0xaa, 0xaa, 0xa6, 0xa3, 0x3f, 0x49, 0x17, 0xea, 0x0b, 0xf1, 0x1a, 0x25,
	0x28, 0x99, 0xb7, 0x72, 0x43, 0xbe, 0xe2, 0xe8, 0xfa, 0x71, 0xa2, 0x2a, 0x14, 0x1d, 0xb2, 0xd7,
	0xa6, 0x99, 0x34, 0x8c, 0x13, 0x72, 0x0b, 0x24, 0x8d, 0xbf, 0xf9, 0x8b, 0xca, 0x5f, 0xd3, 0x4a,
	0xee, 0x9e, 0x41, 0x43, 0xff, 0xa3, 0xeb, 0x05, 0xc8, 0xa4, 0x1b, 0x33, 0xc9, 0xc5, 0xc2, 0xfa,
	0xa7, 0xfe, 0xf1, 0x9a, 0x6e, 0xa7, 0xa7, 0x7a, 0x7a, 0xfa, 0xb0, 0x9b, 0x7e, 0x5c, 0x70, 0x2e,
	0x35, 0x79, 0x9f, 0x81, 0x8f, 0x8a, 0x23, 0x7d, 0xa8, 0x1f, 0x05, 0xfa, 0x1b, 0x64, 0x89, 0x55,
	0x6a, 0x1b, 0x1d, 0x63, 0x5c, 0x70, 0xc8, 0x01, 0x34, 0xcc, 0x34, 0x32, 0x81, 0x3c, 0xca, 0x0d,
	0x44, 0x5e, 0xa1, 0x7c, 0xa2, 0x82, 0x73, 0xa1, 0xa9, 0x91, 0xd8, 0x9d, 0x1f, 0xd6, 0xe0, 0xfc,
	0xf0, 0x7c, 0x73, 0x0d, 0xd5, 0xfc, 0x01, 0x7e, 0x19, 0x7a, 0x06, 0x57, 0xf9, 0xe3, 0x1c, 0x2e,
	0x61, 0x9e, 0xaa, 0x51, 0xcf, 0xc1, 0x2f, 0x43, 0xf8, 0x65, 0x65, 0xbc, 0xfb, 0x0c, 0x00, 0x00,
	0xff, 0xff, 0x5c, 0x80, 0xc6, 0x4f, 0xf4, 0x02, 0x00, 0x00,
}
