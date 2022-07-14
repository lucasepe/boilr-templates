package v1alpha1

import (
	"reflect"

	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime/schema"

	xpv1 "github.com/crossplane/crossplane-runtime/apis/common/v1"
)

// ${RESOURCE_NAME}Parameters are the configurable fields of a ${RESOURCE_NAME}.
type ${RESOURCE_NAME}Parameters struct {
	ConfigurableField string `json:"configurableField"`
}

// ${RESOURCE_NAME}Observation are the observable fields of a ${RESOURCE_NAME}.
type ${RESOURCE_NAME}Observation struct {
	ObservableField string `json:"observableField,omitempty"`
}

// A ${RESOURCE_NAME}Spec defines the desired state of a ${RESOURCE_NAME}.
type ${RESOURCE_NAME}Spec struct {
	xpv1.ResourceSpec `json:",inline"`
	ForProvider       ${RESOURCE_NAME}Parameters `json:"forProvider"`
}

// A ${RESOURCE_NAME}Status represents the observed state of a ${RESOURCE_NAME}.
type ${RESOURCE_NAME}Status struct {
	xpv1.ResourceStatus `json:",inline"`
	AtProvider          ${RESOURCE_NAME}Observation `json:"atProvider,omitempty"`
}

// +kubebuilder:object:root=true

// A ${RESOURCE_NAME} is an example API type.
// +kubebuilder:printcolumn:name="READY",type="string",JSONPath=".status.conditions[?(@.type=='Ready')].status"
// +kubebuilder:printcolumn:name="SYNCED",type="string",JSONPath=".status.conditions[?(@.type=='Synced')].status"
// +kubebuilder:printcolumn:name="EXTERNAL-NAME",type="string",JSONPath=".metadata.annotations.crossplane\\.io/external-name"
// +kubebuilder:printcolumn:name="AGE",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:subresource:status
// +kubebuilder:resource:scope=Cluster,categories={crossplane,managed,${NAME}}
type ${RESOURCE_NAME} struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   ${RESOURCE_NAME}Spec   `json:"spec"`
	Status ${RESOURCE_NAME}Status `json:"status,omitempty"`
}

// +kubebuilder:object:root=true

// ${RESOURCE_NAME}List contains a list of ${RESOURCE_NAME}
type ${RESOURCE_NAME}List struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []${RESOURCE_NAME} `json:"items"`
}

// ${RESOURCE_NAME} type metadata.
var (
	${RESOURCE_NAME}Kind             = reflect.TypeOf(${RESOURCE_NAME}{}).Name()
	${RESOURCE_NAME}GroupKind        = schema.GroupKind{Group: Group, Kind: ${RESOURCE_NAME}Kind}.String()
	${RESOURCE_NAME}KindAPIVersion   = ${RESOURCE_NAME}Kind + "." + SchemeGroupVersion.String()
	${RESOURCE_NAME}GroupVersionKind = SchemeGroupVersion.WithKind(${RESOURCE_NAME}Kind)
)

func init() {
	SchemeBuilder.Register(&${RESOURCE_NAME}{}, &${RESOURCE_NAME}List{})
}
