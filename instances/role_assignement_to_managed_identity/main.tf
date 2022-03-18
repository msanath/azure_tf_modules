provider "azurerm" {
  features {}
}

data "azurerm_user_assigned_identity" "identity"{
  name                = var.managed_identity_name
  resource_group_name = var.managed_identity_resource_group_name
}

data "azurerm_subscription" "current_subscription" {
}

module "role_assignment" {
  source = "../../modules/role_assignment"
  role_assignee_principal_id = data.azurerm_user_assigned_identity.identity.principal_id
  role_def_name = var.role_def_name
  scope_resource_id = data.azurerm_subscription.current_subscription.id
  data_actions = var.data_actions
  actions = var.actions
}
