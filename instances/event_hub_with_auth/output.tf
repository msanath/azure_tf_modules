output "eh_namespace" {
  value = module.event_hub.eh_namespace_name
}

output "eh_namespace_id" {
  value = module.event_hub.eh_namespace_id
}

output "eh_managed_identity_principal_id" {
  value = module.managed_identity.principal_id
}

output "managed_identity_id" {
  value = module.managed_identity.managed_identity_id
}

output "managed_identity_client_id" {
  value = module.managed_identity.managed_identity_client_id
}