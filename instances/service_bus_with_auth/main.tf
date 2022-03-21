# This module sets up an Service Bus instance, and does the following.
#  1. Creates a resource_group to host the EventHub
#  2. Creates an Service Bus instances
#  3. Creates a Managed Identity which can be used to read/write from the EventHub.

provider "azurerm" {
  features {}
}

# Create a Resource Group.
module "resource_group" {
  source              = "../../modules/resource_group"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

module "service_bus" {
  source              = "../../modules/service_bus"
  location            = var.location
  namespace_name      = var.namespace_name
  queue_names         = var.queue_names
  resource_group_name = module.resource_group.resource_group_name
}

# Create a managed identity to access the ServiceBus.
module "managed_identity" {
  source                = "../../modules/user_managed_identity"
  location              = var.location
  managed_identity_name = "${var.namespace_name}-access-identity"
  resource_group_name   = module.resource_group.resource_group_name
}

# roles are picked from
# https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsoftservicebus
module "role_assignment" {
  source                     = "../../modules/role_assignment"
  role_assignee_principal_id = module.managed_identity.principal_id
  role_def_name              = "${var.namespace_name}-access"
  scope_resource_id          = module.service_bus.namespace_id
  data_actions               = ["Microsoft.ServiceBus/*"]
  actions                    = ["Microsoft.ServiceBus/*"]
}

# Assign this user identity to the VMSS or VM to have the ability to publish
# to the EventHub.