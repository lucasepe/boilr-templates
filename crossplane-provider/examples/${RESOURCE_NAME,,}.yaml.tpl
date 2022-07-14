apiVersion: ${RESOURCE_NAME,,}.${API_GROUP}/v1alpha1
kind: ${RESOURCE_NAME}
metadata:
  name: ${RESOURCE_NAME,,}-example
spec:
  forProvider:
    configurableField: test
  providerConfigRef:
    name: ${RESOURCE_NAME,,}-config