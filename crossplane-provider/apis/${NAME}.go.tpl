// Package apis contains Kubernetes API for the ${NAME} provider.
package apis

import (
	"k8s.io/apimachinery/pkg/runtime"

	${RESOURCE_NAME,,}v1alpha1 "github.com/${ORG}/provider-${NAME,,}/apis/${RESOURCE_NAME,,}/v1alpha1"
	${NAME,,}v1alpha1 "github.com/${ORG,,}/provider-${NAME,,}/apis/v1alpha1"
)

func init() {
	// Register the types with the Scheme so the components can map objects to GroupVersionKinds and back
	AddToSchemes = append(AddToSchemes,
		${NAME,,}v1alpha1.SchemeBuilder.AddToScheme,
		${RESOURCE_NAME,,}v1alpha1.SchemeBuilder.AddToScheme,
	)
}

// AddToSchemes may be used to add all resources defined in the project to a Scheme
var AddToSchemes runtime.SchemeBuilder

// AddToScheme adds all Resources to the Scheme
func AddToScheme(s *runtime.Scheme) error {
	return AddToSchemes.AddToScheme(s)
}
