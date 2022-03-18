managed_identity_name = "vmss-test-identity"
managed_identity_resource_group_name = "full_vmss_setup"
role_def_name = "Service_bus_operator"
data_actions = [
  "Microsoft.ServiceBus/*",
  "Microsoft.ServiceBus/*"
]
actions = [
  "Microsoft.ServiceBus/*"
]