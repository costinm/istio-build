// Code generated by protoc-gen-gogo.
// source: mixer/v1/config/cfg.proto
// DO NOT EDIT!

/*
Package istio_mixer_v1_config is a generated protocol buffer package.

It is generated from these files:
	mixer/v1/config/cfg.proto

It has these top-level messages:
	ServiceConfig
	AspectRule
	Aspect
	Adapter
	GlobalConfig
	AttributeManifest
	Uri
	IpAddress
	DnsName
	EmailAddress
	Rule
	Action
	Constructor
	Handler
*/
package istio_mixer_v1_config

import proto "github.com/gogo/protobuf/proto"
import fmt "fmt"
import math "math"
import google_protobuf "github.com/gogo/protobuf/types"
import istio_mixer_v1_config_descriptor1 "istio.io/api/mixer/v1/config/descriptor"
import istio_mixer_v1_config_descriptor2 "istio.io/api/mixer/v1/config/descriptor"
import istio_mixer_v1_config_descriptor3 "istio.io/api/mixer/v1/config/descriptor"
import istio_mixer_v1_config_descriptor4 "istio.io/api/mixer/v1/config/descriptor"
import istio_mixer_v1_config_descriptor5 "istio.io/api/mixer/v1/config/descriptor"
import istio_mixer_v1_config_descriptor "istio.io/api/mixer/v1/config/descriptor"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion2 // please upgrade the proto package

// Configures a set of services.
//
// The following example configures a metric that will be recorded for all services:
//
// ```yaml
// subject: "namespace:ns1"
// revision: "1011"
// rules:
// - selector: target.service == "*"
//   aspects:
//   - kind: metrics
//     params:
//       metrics: # defines metric collection across the board.
//       - descriptorName: response_time_by_status_code
//         value: response.time
//         labels:
//           statusCode: response.code
//
// actionRules:
// - selector: target.service == "*"
//   actions:
//   - handler: prometheus-handler
//     instances:
//     - RequestCountByService
//
// handlers:
// - name: prometheus-handler
//   adapter: prometheus
//   params:
//
// constructors:
// - instanceName: RequestCountByService
//   template: istio.mixer.adapter.metric.Metric
//   params:
//     value: 1
//     dimensions:
//       source: origin.service
//       target_ip: destination.ip
// ```
//
// (== deprecation_description ServiceConfig is deprecated, see the Config API's
// swagger spec. ==)
type ServiceConfig struct {
	// Optional. Subject is unique for a config type.
	// 2 config with the same subject will overwrite each other
	Subject string `protobuf:"bytes,1,opt,name=subject,proto3" json:"subject,omitempty"`
	// Optional. revision of this config. This is assigned by the server
	Revision string        `protobuf:"bytes,2,opt,name=revision,proto3" json:"revision,omitempty"`
	Rules    []*AspectRule `protobuf:"bytes,3,rep,name=rules" json:"rules,omitempty"`
	// Under development, DO NOT USE
	// Optional. List of constructors that can be referenced from [actions][istio.mixer.v1.config.Action.instances]
	Constructors []*Constructor `protobuf:"bytes,4,rep,name=constructors" json:"constructors,omitempty"`
	// Under development, DO NOT USE
	// Optional. List of actions that apply for this service
	// TODO: Rename this to rules once we delete the AspectRule field.
	ActionRules []*Rule `protobuf:"bytes,5,rep,name=action_rules,json=actionRules" json:"action_rules,omitempty"`
}

func (m *ServiceConfig) Reset()                    { *m = ServiceConfig{} }
func (m *ServiceConfig) String() string            { return proto.CompactTextString(m) }
func (*ServiceConfig) ProtoMessage()               {}
func (*ServiceConfig) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{0} }

func (m *ServiceConfig) GetSubject() string {
	if m != nil {
		return m.Subject
	}
	return ""
}

func (m *ServiceConfig) GetRevision() string {
	if m != nil {
		return m.Revision
	}
	return ""
}

func (m *ServiceConfig) GetRules() []*AspectRule {
	if m != nil {
		return m.Rules
	}
	return nil
}

func (m *ServiceConfig) GetConstructors() []*Constructor {
	if m != nil {
		return m.Constructors
	}
	return nil
}

func (m *ServiceConfig) GetActionRules() []*Rule {
	if m != nil {
		return m.ActionRules
	}
	return nil
}

// An AspectRule is a selector and a set of intentions to be executed when the
// selector is `true`. The selectors of the this rule's child AspectRules are only
// evaluated if this rule's selector is true.
type AspectRule struct {
	// Required. Selector is an attribute based predicate. When Mixer receives a
	// request it evaluates all selectors in scope and executes the rules for all
	// selectors that evaluated to true.
	//
	// A few example selectors:
	//
	// * an empty selector evaluates to `true`
	// * `true`, a boolean literal; a rule with this selector will always be executed
	// * `target.service == ratings*` selects any request targeting a service whose
	// name starts with "ratings"
	// * `attr1 == "20" && attr2 == "30"` logical AND, OR, and NOT are also available
	Selector string `protobuf:"bytes,1,opt,name=selector,proto3" json:"selector,omitempty"`
	// The aspects that apply when selector evaluates to `true`.
	Aspects []*Aspect `protobuf:"bytes,2,rep,name=aspects" json:"aspects,omitempty"`
	// Nested aspect rules; their selectors are evaluated if this selector
	// predicate evaluates to `true`.
	Rules []*AspectRule `protobuf:"bytes,3,rep,name=rules" json:"rules,omitempty"`
}

func (m *AspectRule) Reset()                    { *m = AspectRule{} }
func (m *AspectRule) String() string            { return proto.CompactTextString(m) }
func (*AspectRule) ProtoMessage()               {}
func (*AspectRule) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{1} }

func (m *AspectRule) GetSelector() string {
	if m != nil {
		return m.Selector
	}
	return ""
}

func (m *AspectRule) GetAspects() []*Aspect {
	if m != nil {
		return m.Aspects
	}
	return nil
}

func (m *AspectRule) GetRules() []*AspectRule {
	if m != nil {
		return m.Rules
	}
	return nil
}

// Aspect describes how an adapter is intended to operate in the context of the
// rule it's embedded in. The value for `params` depends on the `kind` of this
// aspect: each kind of aspect defines its own `params` proto.
//
// The following example instructs Mixer to populate a metric named "response_time"
// that was declared to have three labels: src_consumer_id, target_response_status_code,
// and target_service_name. For each label and the metric's `value` we provide
// an expression over Istio's attributes. Mixer evaluates these expressions for
// each request.
//
// ```yaml
// kind: metrics
// params:
//   metrics:
//   - descriptorName: response_time # tie this metric to a descriptor of the same name
//     value: response.time  # from the set of canonical attributes
//     labels:
//       src_consumer_id: source.user | source.uid
//       target_response_status_code: response.code
//       target_service_name: target.service
// ```
type Aspect struct {
	// Required. The kind of aspect this intent is targeting.
	Kind string `protobuf:"bytes,1,opt,name=kind,proto3" json:"kind,omitempty"`
	// Optional. The name of the adapter this Aspect targets. If no name is provided,
	// Mixer will use the adapter of the target kind named "default".
	Adapter string `protobuf:"bytes,2,opt,name=adapter,proto3" json:"adapter,omitempty"`
	// Required. Struct representation of a proto defined by each aspect kind.
	Params *google_protobuf.Struct `protobuf:"bytes,4,opt,name=params" json:"params,omitempty"`
}

func (m *Aspect) Reset()                    { *m = Aspect{} }
func (m *Aspect) String() string            { return proto.CompactTextString(m) }
func (*Aspect) ProtoMessage()               {}
func (*Aspect) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{2} }

func (m *Aspect) GetKind() string {
	if m != nil {
		return m.Kind
	}
	return ""
}

func (m *Aspect) GetAdapter() string {
	if m != nil {
		return m.Adapter
	}
	return ""
}

func (m *Aspect) GetParams() *google_protobuf.Struct {
	if m != nil {
		return m.Params
	}
	return nil
}

// Adapter allows the operator to configure a specific adapter implementation.
// Each adapter implementation defines its own `params` proto. Note that unlike
// [Aspect][istio.mixer.v1.config.Aspect], the type of `params` varies with `impl`
// and not with `kind`.
//
// In the following example we define a `metrics` adapter using the Mixer's prepackaged
// prometheus adapter. This adapter doesn't require any parameters.
//
// ```yaml
// kind: metrics
// name: prometheus-adapter
// impl: prometheus
// params:
// ```
type Adapter struct {
	// Required. must be unique per `kind`. Used by [Aspect][istio.mixer.v1.config.Aspect]
	// to refer to this adapter. The name "default" is special: when an Aspect does not
	// specify a name, the Adapter named "default" of the same `kind` is used to execute
	// the intention described by the [AspectRule][istio.mixer.v1.config.AspectRule]s.
	Name string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	// Required. The aspect this implementation with these params will implement;
	// a single adapter implementation may implement many aspects, but an `Adapter`
	// entry is required per kind.
	Kind string `protobuf:"bytes,2,opt,name=kind,proto3" json:"kind,omitempty"`
	// Required. The name of a specific adapter implementation. An adapter's
	// implementation name is typically a constant in its code.
	Impl string `protobuf:"bytes,3,opt,name=impl,proto3" json:"impl,omitempty"`
	// Optional. depends on adapter implementation. Struct representation of a
	// proto defined by the implementation; this varies depending on `impl`.
	Params *google_protobuf.Struct `protobuf:"bytes,4,opt,name=params" json:"params,omitempty"`
}

func (m *Adapter) Reset()                    { *m = Adapter{} }
func (m *Adapter) String() string            { return proto.CompactTextString(m) }
func (*Adapter) ProtoMessage()               {}
func (*Adapter) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{3} }

func (m *Adapter) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *Adapter) GetKind() string {
	if m != nil {
		return m.Kind
	}
	return ""
}

func (m *Adapter) GetImpl() string {
	if m != nil {
		return m.Impl
	}
	return ""
}

func (m *Adapter) GetParams() *google_protobuf.Struct {
	if m != nil {
		return m.Params
	}
	return nil
}

// GlobalConfig defines configuration elements that are available for the rest
// of the config. It is used to configure adapters and make them available in
// AspectRules.
//
// (== deprecation_description GlobalConfig is deprecated, see the Config API's
// swagger spec. ==)
type GlobalConfig struct {
	// Optional.
	Revision  string               `protobuf:"bytes,1,opt,name=revision,proto3" json:"revision,omitempty"`
	Adapters  []*Adapter           `protobuf:"bytes,2,rep,name=adapters" json:"adapters,omitempty"`
	Manifests []*AttributeManifest `protobuf:"bytes,3,rep,name=manifests" json:"manifests,omitempty"`
	// TODO: remove these in https://github.com/istio/api/pull/45
	Logs               []*istio_mixer_v1_config_descriptor1.LogEntryDescriptor          `protobuf:"bytes,4,rep,name=logs" json:"logs,omitempty"`
	Metrics            []*istio_mixer_v1_config_descriptor2.MetricDescriptor            `protobuf:"bytes,5,rep,name=metrics" json:"metrics,omitempty"`
	MonitoredResources []*istio_mixer_v1_config_descriptor3.MonitoredResourceDescriptor `protobuf:"bytes,6,rep,name=monitored_resources,json=monitoredResources" json:"monitored_resources,omitempty"`
	Principals         []*istio_mixer_v1_config_descriptor4.PrincipalDescriptor         `protobuf:"bytes,7,rep,name=principals" json:"principals,omitempty"`
	Quotas             []*istio_mixer_v1_config_descriptor5.QuotaDescriptor             `protobuf:"bytes,8,rep,name=quotas" json:"quotas,omitempty"`
	// Under development, DO NOT USE
	// Optional. List of handlers that can be referenced from [actions][istio.mixer.v1.config.Action.handler]
	Handlers []*Handler `protobuf:"bytes,9,rep,name=handlers" json:"handlers,omitempty"`
}

func (m *GlobalConfig) Reset()                    { *m = GlobalConfig{} }
func (m *GlobalConfig) String() string            { return proto.CompactTextString(m) }
func (*GlobalConfig) ProtoMessage()               {}
func (*GlobalConfig) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{4} }

func (m *GlobalConfig) GetRevision() string {
	if m != nil {
		return m.Revision
	}
	return ""
}

func (m *GlobalConfig) GetAdapters() []*Adapter {
	if m != nil {
		return m.Adapters
	}
	return nil
}

func (m *GlobalConfig) GetManifests() []*AttributeManifest {
	if m != nil {
		return m.Manifests
	}
	return nil
}

func (m *GlobalConfig) GetLogs() []*istio_mixer_v1_config_descriptor1.LogEntryDescriptor {
	if m != nil {
		return m.Logs
	}
	return nil
}

func (m *GlobalConfig) GetMetrics() []*istio_mixer_v1_config_descriptor2.MetricDescriptor {
	if m != nil {
		return m.Metrics
	}
	return nil
}

func (m *GlobalConfig) GetMonitoredResources() []*istio_mixer_v1_config_descriptor3.MonitoredResourceDescriptor {
	if m != nil {
		return m.MonitoredResources
	}
	return nil
}

func (m *GlobalConfig) GetPrincipals() []*istio_mixer_v1_config_descriptor4.PrincipalDescriptor {
	if m != nil {
		return m.Principals
	}
	return nil
}

func (m *GlobalConfig) GetQuotas() []*istio_mixer_v1_config_descriptor5.QuotaDescriptor {
	if m != nil {
		return m.Quotas
	}
	return nil
}

func (m *GlobalConfig) GetHandlers() []*Handler {
	if m != nil {
		return m.Handlers
	}
	return nil
}

// AttributeManifest describes a set of Attributes produced by some component
// of an Istio deployment.
type AttributeManifest struct {
	// Optional. The revision of this document. Assigned by server.
	Revision string `protobuf:"bytes,1,opt,name=revision,proto3" json:"revision,omitempty"`
	// Required. Name of the component producing these attributes. This can be
	// the proxy (with the canonical name "istio-proxy") or the name of an
	// `attributes` kind adapter in Mixer.
	Name string `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	// The set of attributes this Istio component will be responsible for producing at runtime.
	// We map from attribute name to the attribute's specification. The name of an attribute,
	// which is how attributes are referred to in aspect configuration, must conform to:
	//
	//     Name = IDENT { SEPARATOR IDENT };
	//
	// Where `IDENT` must match the regular expression `[a-z][a-z0-9]+` and `SEPARATOR` must
	// match the regular expression `[\.-]`.
	//
	// Attribute names must be unique within a single Istio deployment. The set of canonical
	// attributes are described at https://istio.io/docs/reference/attribute-vocabulary.html.
	// Attributes not in that list should be named with a component-specific suffix such as
	// request.count-my.component
	Attributes map[string]*AttributeManifest_AttributeInfo `protobuf:"bytes,3,rep,name=attributes" json:"attributes,omitempty" protobuf_key:"bytes,1,opt,name=key,proto3" protobuf_val:"bytes,2,opt,name=value"`
}

func (m *AttributeManifest) Reset()                    { *m = AttributeManifest{} }
func (m *AttributeManifest) String() string            { return proto.CompactTextString(m) }
func (*AttributeManifest) ProtoMessage()               {}
func (*AttributeManifest) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{5} }

func (m *AttributeManifest) GetRevision() string {
	if m != nil {
		return m.Revision
	}
	return ""
}

func (m *AttributeManifest) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *AttributeManifest) GetAttributes() map[string]*AttributeManifest_AttributeInfo {
	if m != nil {
		return m.Attributes
	}
	return nil
}

// AttributeInfo describes the schema of an Istio `Attribute`.
//
// ## Istio Attributes
//
// Istio uses `attributes` to describe runtime activities of Istio services.
// An Istio attribute carries a specific piece of information about an activity,
// such as the error code of an API request, the latency of an API request, or the
// original IP address of a TCP connection. The attributes are often generated
// and consumed by different services. For example, a frontend service can
// generate an authenticated user attribute and pass it to a backend service for
// access control purpose.
//
// To simplify the system and improve developer experience, Istio uses
// shared attribute definitions across all components. For example, the same
// authenticated user attribute will be used for logging, monitoring, analytics,
// billing, access control, auditing. Many Istio components provide their
// functionality by collecting, generating, and operating on attributes.
// For example, the proxy collects the error code attribute, and the logging
// stores it into a log.
//
// ## Design
//
// Each Istio attribute must conform to an `AttributeInfo` in an
// `AttributeManifest` in the current Istio deployment at runtime. An
// [`AttributeInfo`][istio.mixer.v1.config] is used to define an attribute's
// metadata: the type of its value and a detailed description that explains
// the semantics of the attribute type. Each attribute's name is globally unique;
// in other words an attribute name can only appear once across all manifests.
//
// The runtime presentation of an attribute is intentionally left out of this
// specification, because passing attribute using JSON, XML, or Protocol Buffers
// does not change the semantics of the attribute. Different implementations
// can choose different representations based on their needs.
//
// ## HTTP Mapping
//
// Because many systems already have REST APIs, it makes sense to define a
// standard HTTP mapping for Istio attributes that are compatible with typical
// REST APIs. The design is to map one attribute to one HTTP header, the
// attribute name and value becomes the HTTP header name and value. The actual
// encoding scheme will be decided later.
type AttributeManifest_AttributeInfo struct {
	// Optional. A human-readable description of the attribute's purpose.
	Description string `protobuf:"bytes,1,opt,name=description,proto3" json:"description,omitempty"`
	// Required. The type of data carried by this attribute.
	ValueType istio_mixer_v1_config_descriptor.ValueType `protobuf:"varint,2,opt,name=value_type,json=valueType,proto3,enum=istio.mixer.v1.config.descriptor.ValueType" json:"value_type,omitempty"`
}

func (m *AttributeManifest_AttributeInfo) Reset()         { *m = AttributeManifest_AttributeInfo{} }
func (m *AttributeManifest_AttributeInfo) String() string { return proto.CompactTextString(m) }
func (*AttributeManifest_AttributeInfo) ProtoMessage()    {}
func (*AttributeManifest_AttributeInfo) Descriptor() ([]byte, []int) {
	return fileDescriptorCfg, []int{5, 0}
}

func (m *AttributeManifest_AttributeInfo) GetDescription() string {
	if m != nil {
		return m.Description
	}
	return ""
}

func (m *AttributeManifest_AttributeInfo) GetValueType() istio_mixer_v1_config_descriptor.ValueType {
	if m != nil {
		return m.ValueType
	}
	return istio_mixer_v1_config_descriptor.ValueType_VALUE_TYPE_UNSPECIFIED
}

// Uri represents a properly formed URI.
type Uri struct {
	Value string `protobuf:"bytes,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (m *Uri) Reset()                    { *m = Uri{} }
func (m *Uri) String() string            { return proto.CompactTextString(m) }
func (*Uri) ProtoMessage()               {}
func (*Uri) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{6} }

func (m *Uri) GetValue() string {
	if m != nil {
		return m.Value
	}
	return ""
}

// IpAddress holds an IPv4 or IPv6 address.
type IpAddress struct {
	Value []byte `protobuf:"bytes,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (m *IpAddress) Reset()                    { *m = IpAddress{} }
func (m *IpAddress) String() string            { return proto.CompactTextString(m) }
func (*IpAddress) ProtoMessage()               {}
func (*IpAddress) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{7} }

func (m *IpAddress) GetValue() []byte {
	if m != nil {
		return m.Value
	}
	return nil
}

// DnsName holds a valid domain name.
type DnsName struct {
	Value string `protobuf:"bytes,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (m *DnsName) Reset()                    { *m = DnsName{} }
func (m *DnsName) String() string            { return proto.CompactTextString(m) }
func (*DnsName) ProtoMessage()               {}
func (*DnsName) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{8} }

func (m *DnsName) GetValue() string {
	if m != nil {
		return m.Value
	}
	return ""
}

// EmailAddress holds a properly formatted email address.
type EmailAddress struct {
	Value string `protobuf:"bytes,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (m *EmailAddress) Reset()                    { *m = EmailAddress{} }
func (m *EmailAddress) String() string            { return proto.CompactTextString(m) }
func (*EmailAddress) ProtoMessage()               {}
func (*EmailAddress) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{9} }

func (m *EmailAddress) GetValue() string {
	if m != nil {
		return m.Value
	}
	return ""
}

// A Rule is a selector and a set of intentions to be executed when the
// selector is `true`
//
// The following example instructs Mixer to invoke 'prometheus-handler' handler for all services and pass it the
// instance constructed using the 'RequestCountByService' constructor.
//
// ```yaml
// actionRules:
// - selector: target.service == "*"
//   actions:
//   - handler: prometheus-handler
//     instances:
//     - RequestCountByService
// ```
type Rule struct {
	// Required. Selector is an attribute based predicate. When Mixer receives a
	// request it evaluates all selectors in scope and executes the `actions` for all
	// selectors that evaluated to true.
	//
	// A few example selectors:
	//
	// * an empty selector evaluates to `true`
	// * `true`, a boolean literal; a rule with this selector will always be executed
	// * `target.service == ratings*` selects any request targeting a service whose
	// name starts with "ratings"
	// * `attr1 == "20" && attr2 == "30"` logical AND, OR, and NOT are also available
	Selector string `protobuf:"bytes,1,opt,name=selector,proto3" json:"selector,omitempty"`
	// Optional. The actions that will be executed when selector evaluates to `true`.
	Actions []*Action `protobuf:"bytes,2,rep,name=actions" json:"actions,omitempty"`
	// Optional. Nested action rules; their selectors are evaluated if this selector
	// predicate evaluates to `true`.
	Rules []*Rule `protobuf:"bytes,3,rep,name=rules" json:"rules,omitempty"`
}

func (m *Rule) Reset()                    { *m = Rule{} }
func (m *Rule) String() string            { return proto.CompactTextString(m) }
func (*Rule) ProtoMessage()               {}
func (*Rule) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{10} }

func (m *Rule) GetSelector() string {
	if m != nil {
		return m.Selector
	}
	return ""
}

func (m *Rule) GetActions() []*Action {
	if m != nil {
		return m.Actions
	}
	return nil
}

func (m *Rule) GetRules() []*Rule {
	if m != nil {
		return m.Rules
	}
	return nil
}

// Action describes which [Handler][istio.mixer.v1.config.Handler] to invoke and what data to pass to it for processing.
//
// The following example instructs Mixer to invoke 'prometheus-handler' handler and pass it the object
// constructed using the constructor 'RequestCountByService'
//
// ```yaml
// - handler: prometheus-handler
//   instances:
//   - RequestCountByService
// ```
type Action struct {
	// Required. The handler to invoke. Must match the `name` of a [Handler][istio.mixer.v1.config.Handler.name] in scope.
	Handler string `protobuf:"bytes,2,opt,name=handler,proto3" json:"handler,omitempty"`
	// Required. Each value must match the `instance_name` of the
	// [Constructor][istio.mixer.v1.config.Constructor.instance_name]s in scope.
	// Referenced constructors are evaluated by resolving the attributes/literals for all the fields.
	// The constructed objects are then passed to the `handler` referenced within this action.
	Instances []string `protobuf:"bytes,3,rep,name=instances" json:"instances,omitempty"`
}

func (m *Action) Reset()                    { *m = Action{} }
func (m *Action) String() string            { return proto.CompactTextString(m) }
func (*Action) ProtoMessage()               {}
func (*Action) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{11} }

func (m *Action) GetHandler() string {
	if m != nil {
		return m.Handler
	}
	return ""
}

func (m *Action) GetInstances() []string {
	if m != nil {
		return m.Instances
	}
	return nil
}

// A Constructor tells Mixer how to create instances for particular template.
//
// Constructor is defined by the operator. Constructor is defined relative to a known
// template. Their purpose is to tell Mixer how to use attributes or literals to produce
// instances of the specified template at runtime.
//
// The following example instructs Mixer to construct an instance associated with template
// 'istio.mixer.adapter.metric.Metric'. It provides a mapping from the template's fields to expressions.
// Instances produced with this constructor can be referenced by [Actions][istio.mixer.v1.config.Action] using name
// 'RequestCountByService'.
//
// ```yaml
// - instanceName: RequestCountByService
//   template: istio.mixer.adapter.metric.Metric
//   params:
//     value: 1
//     dimensions:
//       source: origin.service
//       target_ip: destination.ip
// ```
type Constructor struct {
	// Required. The name of this constructor
	//
	// Must be unique amongst other Constructors in scope. Used by [Action][istio.mixer.v1.config.Action] to refer
	// to an instance produced by this constructor.
	InstanceName string `protobuf:"bytes,1,opt,name=instance_name,json=instanceName,proto3" json:"instance_name,omitempty"`
	// Required. The name of the template this constructor creates instances for.
	// The value must match the name of the available template in scope.
	Template string `protobuf:"bytes,2,opt,name=template,proto3" json:"template,omitempty"`
	// Required. Depends on referenced template. Struct representation of a
	// proto defined by the template; this varies depending on the value of field `template`.
	Params *google_protobuf.Struct `protobuf:"bytes,3,opt,name=params" json:"params,omitempty"`
}

func (m *Constructor) Reset()                    { *m = Constructor{} }
func (m *Constructor) String() string            { return proto.CompactTextString(m) }
func (*Constructor) ProtoMessage()               {}
func (*Constructor) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{12} }

func (m *Constructor) GetInstanceName() string {
	if m != nil {
		return m.InstanceName
	}
	return ""
}

func (m *Constructor) GetTemplate() string {
	if m != nil {
		return m.Template
	}
	return ""
}

func (m *Constructor) GetParams() *google_protobuf.Struct {
	if m != nil {
		return m.Params
	}
	return nil
}

// Handler allows the operator to configure a specific adapter implementation.
// Each adapter implementation defines its own `params` proto.
//
// In the following example we define a `metrics` adapter using the Mixer's prepackaged
// prometheus adapter. This adapter doesn't require any parameters.
//
// ```yaml
// name: prometheus-handler
// adapter: prometheus
// params:
// ```
type Handler struct {
	// Required. Must be unique in the entire mixer configuration. Used by [Actions][istio.mixer.v1.config.Action.handler]
	// to refer to this handler.
	Name string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	// Required. The name of a specific adapter implementation. An adapter's
	// implementation name is typically a constant in its code.
	Adapter string `protobuf:"bytes,2,opt,name=adapter,proto3" json:"adapter,omitempty"`
	// Optional. Depends on adapter implementation. Struct representation of a
	// proto defined by the adapter implementation; this varies depending on the value of field `adapter`.
	Params *google_protobuf.Struct `protobuf:"bytes,3,opt,name=params" json:"params,omitempty"`
}

func (m *Handler) Reset()                    { *m = Handler{} }
func (m *Handler) String() string            { return proto.CompactTextString(m) }
func (*Handler) ProtoMessage()               {}
func (*Handler) Descriptor() ([]byte, []int) { return fileDescriptorCfg, []int{13} }

func (m *Handler) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *Handler) GetAdapter() string {
	if m != nil {
		return m.Adapter
	}
	return ""
}

func (m *Handler) GetParams() *google_protobuf.Struct {
	if m != nil {
		return m.Params
	}
	return nil
}

func init() {
	proto.RegisterType((*ServiceConfig)(nil), "istio.mixer.v1.config.ServiceConfig")
	proto.RegisterType((*AspectRule)(nil), "istio.mixer.v1.config.AspectRule")
	proto.RegisterType((*Aspect)(nil), "istio.mixer.v1.config.Aspect")
	proto.RegisterType((*Adapter)(nil), "istio.mixer.v1.config.Adapter")
	proto.RegisterType((*GlobalConfig)(nil), "istio.mixer.v1.config.GlobalConfig")
	proto.RegisterType((*AttributeManifest)(nil), "istio.mixer.v1.config.AttributeManifest")
	proto.RegisterType((*AttributeManifest_AttributeInfo)(nil), "istio.mixer.v1.config.AttributeManifest.AttributeInfo")
	proto.RegisterType((*Uri)(nil), "istio.mixer.v1.config.Uri")
	proto.RegisterType((*IpAddress)(nil), "istio.mixer.v1.config.IpAddress")
	proto.RegisterType((*DnsName)(nil), "istio.mixer.v1.config.DnsName")
	proto.RegisterType((*EmailAddress)(nil), "istio.mixer.v1.config.EmailAddress")
	proto.RegisterType((*Rule)(nil), "istio.mixer.v1.config.Rule")
	proto.RegisterType((*Action)(nil), "istio.mixer.v1.config.Action")
	proto.RegisterType((*Constructor)(nil), "istio.mixer.v1.config.Constructor")
	proto.RegisterType((*Handler)(nil), "istio.mixer.v1.config.Handler")
}

func init() { proto.RegisterFile("mixer/v1/config/cfg.proto", fileDescriptorCfg) }

var fileDescriptorCfg = []byte{
	// 898 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x94, 0x55, 0x5b, 0x8f, 0xdb, 0x44,
	0x14, 0x96, 0x93, 0x6c, 0xb2, 0x39, 0xc9, 0x72, 0x19, 0x40, 0x98, 0xb4, 0xc0, 0x36, 0xf0, 0xb0,
	0x52, 0x25, 0x47, 0x09, 0x94, 0x56, 0x8b, 0xa8, 0x58, 0x7a, 0xa1, 0x8b, 0xb6, 0x08, 0x5c, 0x8a,
	0x78, 0x8b, 0x26, 0xce, 0x24, 0x1d, 0x6a, 0x7b, 0xcc, 0xcc, 0x38, 0x62, 0x1f, 0x10, 0xff, 0xa0,
	0x2f, 0xbc, 0x20, 0x7e, 0x2d, 0x9a, 0x9b, 0xed, 0xdd, 0x24, 0x4e, 0xf6, 0x6d, 0x2e, 0xdf, 0xf7,
	0x9d, 0x33, 0x67, 0xce, 0xcc, 0x07, 0x1f, 0x25, 0xf4, 0x4f, 0xc2, 0x47, 0xab, 0xf1, 0x28, 0x62,
	0xe9, 0x82, 0x2e, 0x47, 0xd1, 0x62, 0x19, 0x64, 0x9c, 0x49, 0x86, 0x3e, 0xa0, 0x42, 0x52, 0x16,
	0x68, 0x40, 0xb0, 0x1a, 0x07, 0x06, 0x30, 0xb8, 0xbd, 0x64, 0x6c, 0x19, 0x93, 0x91, 0x06, 0xcd,
	0xf2, 0xc5, 0x48, 0x48, 0x9e, 0x47, 0xd2, 0x90, 0x06, 0xf7, 0xae, 0xeb, 0xcd, 0x89, 0x88, 0x38,
	0xcd, 0x24, 0xe3, 0xa3, 0x98, 0x2d, 0xa7, 0x24, 0x95, 0xfc, 0x72, 0x5a, 0x2e, 0x5a, 0xda, 0xa4,
	0x86, 0x96, 0x10, 0xc9, 0x69, 0xb4, 0xce, 0x79, 0x58, 0xc7, 0x61, 0x29, 0x95, 0x8c, 0x93, 0xf9,
	0x94, 0x13, 0xc1, 0x72, 0x1e, 0x91, 0x75, 0x7e, 0x5d, 0xaa, 0x19, 0xa7, 0x69, 0x44, 0x33, 0x1c,
	0xaf, 0xd3, 0xc6, 0x35, 0xb4, 0x3f, 0x72, 0x26, 0xf1, 0x3a, 0xe5, 0x6e, 0x0d, 0x65, 0x85, 0xe3,
	0x9c, 0x4c, 0xe5, 0x65, 0x46, 0x0c, 0x78, 0xf8, 0xa6, 0x01, 0x47, 0x2f, 0x08, 0x5f, 0xd1, 0x88,
	0x3c, 0xd2, 0x68, 0xe4, 0x43, 0x47, 0xe4, 0xb3, 0xdf, 0x49, 0x24, 0x7d, 0xef, 0xd8, 0x3b, 0xe9,
	0x86, 0x6e, 0x8a, 0x06, 0x70, 0xc8, 0xc9, 0x8a, 0x0a, 0xca, 0x52, 0xbf, 0xa1, 0xb7, 0x8a, 0x39,
	0xfa, 0x1a, 0x0e, 0x78, 0x1e, 0x13, 0xe1, 0x37, 0x8f, 0x9b, 0x27, 0xbd, 0xc9, 0x9d, 0x60, 0xe3,
	0x75, 0x06, 0x67, 0x22, 0x23, 0x91, 0x0c, 0xf3, 0x98, 0x7c, 0xd7, 0xf0, 0xbd, 0xd0, 0x70, 0xd0,
	0x53, 0xe8, 0x47, 0x2c, 0x35, 0x37, 0xcb, 0xb8, 0xf0, 0x5b, 0x5a, 0x63, 0xb8, 0x45, 0xe3, 0x51,
	0x09, 0x0d, 0xaf, 0xf0, 0xd0, 0x43, 0xe8, 0xe3, 0x48, 0x52, 0x96, 0x4e, 0x4d, 0x2e, 0x07, 0x5a,
	0xe7, 0xd6, 0x16, 0x1d, 0x95, 0x45, 0xd8, 0x33, 0x04, 0x35, 0x16, 0xa7, 0x0d, 0xdf, 0x1b, 0xfe,
	0xe7, 0x01, 0x94, 0x59, 0xaa, 0x33, 0x0b, 0x12, 0x13, 0xa5, 0x6f, 0xcb, 0x51, 0xcc, 0xd1, 0x7d,
	0xe8, 0x60, 0x8d, 0x14, 0x7e, 0x43, 0x47, 0xfa, 0xb8, 0xfe, 0xd4, 0x0e, 0x8d, 0xee, 0xdf, 0xb4,
	0x58, 0xb6, 0x50, 0xc3, 0x25, 0xb4, 0xcd, 0x22, 0x42, 0xd0, 0x7a, 0x4d, 0xd3, 0xb9, 0xcd, 0x49,
	0x8f, 0xd5, 0xcd, 0xe1, 0x39, 0xce, 0x24, 0xe1, 0xf6, 0x7a, 0xdc, 0x14, 0x8d, 0xa0, 0x9d, 0x61,
	0x8e, 0x13, 0x55, 0x5a, 0xef, 0xa4, 0x37, 0xf9, 0x30, 0x30, 0xcf, 0x2a, 0x70, 0xcf, 0x2a, 0x78,
	0xa1, 0x8b, 0x18, 0x5a, 0xd8, 0x70, 0x05, 0x9d, 0x33, 0xcb, 0x45, 0xd0, 0x4a, 0x71, 0x42, 0x5c,
	0x24, 0x35, 0x2e, 0xa2, 0x37, 0x2a, 0xd1, 0x11, 0xb4, 0x68, 0x92, 0xc5, 0x7e, 0xd3, 0xac, 0xa9,
	0xf1, 0xcd, 0xe3, 0xfe, 0x7b, 0x00, 0xfd, 0xef, 0x63, 0x36, 0xc3, 0xb1, 0xed, 0xc6, 0x6a, 0xcf,
	0x79, 0xd7, 0x7a, 0xee, 0x14, 0x0e, 0xed, 0x01, 0xdd, 0x05, 0x7c, 0xb2, 0xad, 0x92, 0x06, 0x16,
	0x16, 0x78, 0xf4, 0x14, 0xba, 0x09, 0x4e, 0xe9, 0x82, 0x08, 0xe9, 0xae, 0xe1, 0x64, 0x1b, 0x59,
	0x4a, 0x4e, 0x67, 0xb9, 0x24, 0xcf, 0x2d, 0x21, 0x2c, 0xa9, 0xe8, 0x19, 0xb4, 0x62, 0xb6, 0x74,
	0x2d, 0xfb, 0xe5, 0x16, 0x89, 0xca, 0x1b, 0xbd, 0x60, 0xcb, 0x27, 0xea, 0x57, 0x7a, 0x5c, 0x2c,
	0x85, 0x5a, 0x01, 0x5d, 0x40, 0xc7, 0xfc, 0x3d, 0xae, 0x6f, 0x27, 0xbb, 0xc5, 0x9e, 0x6b, 0x42,
	0x45, 0xca, 0x49, 0xa0, 0x14, 0xde, 0x5b, 0xff, 0x95, 0x84, 0xdf, 0xd6, 0xca, 0xdf, 0xec, 0xa1,
	0xec, 0xc8, 0xa1, 0xe5, 0x56, 0x82, 0xa0, 0xe4, 0xfa, 0xa6, 0x40, 0x2f, 0x01, 0x8a, 0x5f, 0x4c,
	0xf8, 0x1d, 0x1d, 0xe6, 0xde, 0xee, 0x30, 0x3f, 0x39, 0x4e, 0x45, 0xbe, 0x22, 0x84, 0xce, 0xa1,
	0xad, 0x7f, 0x39, 0xe1, 0x1f, 0x6a, 0xc9, 0xf1, 0x6e, 0xc9, 0x9f, 0x15, 0xbe, 0x22, 0x67, 0x05,
	0x54, 0xb7, 0xbc, 0xc2, 0xe9, 0x3c, 0x56, 0xdd, 0xd2, 0xad, 0xed, 0x96, 0x67, 0x06, 0x16, 0x16,
	0x78, 0xfd, 0x31, 0xfc, 0xd3, 0x84, 0x77, 0xd7, 0x5a, 0xa1, 0xb6, 0x3f, 0xdd, 0xcb, 0x69, 0x54,
	0x5e, 0xce, 0x6f, 0x00, 0xd8, 0x89, 0xb8, 0xc6, 0x7b, 0xb0, 0x6f, 0xe3, 0x95, 0x2b, 0x42, 0xf7,
	0x50, 0x58, 0xd1, 0x1a, 0xfc, 0x05, 0x47, 0xc5, 0xf6, 0x79, 0xba, 0x60, 0xe8, 0x18, 0x7a, 0xae,
	0x2c, 0x65, 0x76, 0xd5, 0x25, 0xf4, 0x03, 0x40, 0x69, 0x08, 0x3a, 0xcd, 0xb7, 0x26, 0x77, 0x77,
	0x57, 0xf8, 0x57, 0xc5, 0xf9, 0xe5, 0x32, 0x23, 0x61, 0x77, 0xe5, 0x86, 0x83, 0x1c, 0xde, 0xbe,
	0x96, 0x1d, 0x7a, 0x07, 0x9a, 0xaf, 0xc9, 0xa5, 0x0d, 0xac, 0x86, 0xe8, 0x02, 0x0e, 0x34, 0x43,
	0xc7, 0xea, 0x4d, 0xbe, 0xba, 0xf9, 0xc1, 0xd5, 0xc9, 0x42, 0x23, 0x72, 0xda, 0x78, 0xe0, 0x0d,
	0x6f, 0x41, 0xf3, 0x25, 0xa7, 0xe8, 0x7d, 0x27, 0x6c, 0x82, 0x99, 0xc9, 0xf0, 0x0e, 0x74, 0xcf,
	0xb3, 0xb3, 0xf9, 0x9c, 0x13, 0x21, 0xae, 0x42, 0xfa, 0x0e, 0xf2, 0x29, 0x74, 0x1e, 0xa7, 0xe2,
	0x47, 0x75, 0x35, 0x9b, 0x35, 0x3e, 0x87, 0xfe, 0x93, 0x04, 0xd3, 0x78, 0xa3, 0x4c, 0x81, 0x7a,
	0xe3, 0x41, 0x6b, 0x2f, 0xbf, 0xd0, 0x6e, 0xb3, 0xd3, 0x2f, 0x8c, 0x27, 0x39, 0x34, 0x1a, 0x5f,
	0xf5, 0x8b, 0x5a, 0x43, 0xb3, 0x4e, 0xf1, 0x2d, 0xb4, 0x8d, 0x8a, 0x72, 0x05, 0xdb, 0xc7, 0xce,
	0x15, 0xec, 0x14, 0xdd, 0x86, 0x2e, 0x4d, 0x85, 0xc4, 0x69, 0x64, 0xa5, 0xbb, 0x61, 0xb9, 0x30,
	0xfc, 0x1b, 0x7a, 0x15, 0xa7, 0x45, 0x9f, 0xc1, 0x91, 0xdb, 0x9b, 0x56, 0xfc, 0xa0, 0xef, 0x16,
	0x75, 0x09, 0x07, 0x70, 0x28, 0x49, 0x92, 0xc5, 0x58, 0xba, 0xae, 0x2f, 0xe6, 0x15, 0x2f, 0x68,
	0xee, 0xe7, 0x05, 0xaf, 0xa0, 0x63, 0x5f, 0xe2, 0x46, 0x0f, 0xda, 0xc7, 0xed, 0xf6, 0x8b, 0x34,
	0x6b, 0xeb, 0x8d, 0x2f, 0xfe, 0x0f, 0x00, 0x00, 0xff, 0xff, 0x57, 0x0b, 0x76, 0x84, 0x9f, 0x0a,
	0x00, 0x00,
}
