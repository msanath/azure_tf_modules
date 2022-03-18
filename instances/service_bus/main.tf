# This module sets up a Service Bus

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../modules/resource_group"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

module "service_bus" {
  source = "../../modules/service_bus"
  location = var.location
  namespace_name = var.namespace_name
  queue_names = var.queue_names
  resource_group_name = module.resource_group.resource_group_name
}
