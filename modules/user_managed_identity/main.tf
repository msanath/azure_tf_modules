resource "azurerm_user_assigned_identity" "user_managed_identity" {
  location            = var.location
  name                = var.managed_identity_name
  resource_group_name = var.resource_group_name
}