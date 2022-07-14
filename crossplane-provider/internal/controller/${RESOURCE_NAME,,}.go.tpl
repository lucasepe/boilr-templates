package controller

import (
	"github.com/crossplane/crossplane-runtime/pkg/controller"
	ctrl "sigs.k8s.io/controller-runtime"

	"github.com/${ORG}/provider-${NAME}/internal/controller/config"
	"github.com/${ORG}/provider-${NAME}/internal/controller/${RESOURCE_NAME,,}"
)

// Setup creates all ${NAME} controllers with the supplied logger and adds them to
// the supplied manager.
func Setup(mgr ctrl.Manager, o controller.Options) error {
	for _, setup := range []func(ctrl.Manager, controller.Options) error{
		config.Setup,
		${RESOURCE_NAME,,}.Setup,
	} {
		if err := setup(mgr, o); err != nil {
			return err
		}
	}
	return nil
}
