apiVersion: ${NAME,,}.krateo.io/v1alpha1
kind: ProviderConfig
metadata:
  name: provider-${NAME,,}-config
spec:
  credentials:
    source: Secret
    secretRef:
      namespace: default
      name: provider-${NAME,,}-secret
      key: credentials
