resource "azurerm_role_definition" "definition" {
  name  = var.role_def_name
  scope = var.scope_resource_id

  permissions {
    actions = var.actions
    not_actions = var.not_actions
    data_actions = var.data_actions
    not_data_actions = var.not_data_actions
  }
}

resource "azurerm_role_assignment" "assignment" {
  role_definition_name = var.role_def_name
  principal_id = var.role_assignee_principal_id
  scope        = var.scope_resource_id
}