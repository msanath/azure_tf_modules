output "principal_id" {
  value = azurerm_user_assigned_identity.user_managed_identity.principal_id
}

output "managed_identity_id" {
  value = azurerm_user_assigned_identity.user_managed_identity.id
}

output "managed_identity_client_id" {
  value = azurerm_user_assigned_identity.user_managed_identity.client_id
}