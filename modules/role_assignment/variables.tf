variable "scope_resource_id" {
  type = string
  description = "The ID of the resource for which the role definition applies. https://docs.microsoft.com/en-us/azure/role-based-access-control/role-definitions"
}

variable "role_def_name" {
  type = string
  description = "A name for the role definition."
}

variable "actions" {
  type = list(string)
  default = []
  description = "One or more actions. https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsoftservicebus"
}

variable "not_actions" {
  type = list(string)
  default = []
  description = "One or more actions. https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsoftservicebus"
}

variable "data_actions" {
  type = list(string)
  default = []
  description = "One or more actions. https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsoftservicebus"
}

variable "not_data_actions" {
  type = list(string)
  default = []
  description = "One or more actions. https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsoftservicebus"
}

variable "role_assignee_principal_id" {
  type = string
  description = "The principal ID of the resource which needs to get the role."
}