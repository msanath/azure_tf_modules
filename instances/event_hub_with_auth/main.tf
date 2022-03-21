# This module sets up an Event Hub instance, and does the following.
#  1. Creates a resource_group to host the EventHub
#  2. Creates an Event Hub instances
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

# Create an Event Hub instance
module "event_hub" {
  source                 = "../../modules/event_hub"
  eh_namespace_name      = var.eh_namespaces_name
  eh_resource_group_name = module.resource_group.resource_group_name
  location               = var.location
  partition_count        = var.partition_count
  retention_days         = var.retention_days
  topic_names            = var.topic_names
}

# Create a managed identity to access the EventHub.
module "managed_identity" {
  source                = "../../modules/user_managed_identity"
  location              = var.location
  managed_identity_name = "${var.eh_namespaces_name}-access-identity"
  resource_group_name   = module.resource_group.resource_group_name
}

# roles are picked from
# https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations#microsofteventhub
module "role_assignment" {
  source                     = "../../modules/role_assignment"
  role_assignee_principal_id = module.managed_identity.principal_id
  role_def_name              = "${var.eh_namespaces_name}-access"
  scope_resource_id          = module.event_hub.eh_namespace_id
  data_actions               = ["Microsoft.EventHub/*"]
  actions                    = ["Microsoft.EventHub/*"]
}

# Assign this user identity to the VMSS or VM to have the ability to publish
# to the EventHub.