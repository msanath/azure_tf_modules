output "namespace_id" {
  value = module.service_bus.namespace_id
}

output "managed_identity_principal_id" {
  value = module.managed_identity.principal_id
}

output "managed_identity_id" {
  value = module.managed_identity.managed_identity_id
}

output "managed_identity_client_id" {
  value = module.managed_identity.managed_identity_client_id
}