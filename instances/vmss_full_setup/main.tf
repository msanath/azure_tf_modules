# This module sets up a VMSS with
# * resource group
# * VNET
# * SUBNET
provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../modules/resource_group"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

module "vnet" {
  source = "../../modules/vnet"
  address_space = var.address_space
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name = var.vnet_name
  tags = var.tags
}

module "subnet" {
  source = "../../modules/subnet"
  resource_group_name = module.resource_group.resource_group_name
  subnet_name = var.subnet_name
  vnet_name = module.vnet.vnet_name
  address_prefixes = var.subnet_prefixes
}

# create a random admin username
resource "random_string" "username" {
  length           = 16
  special          = false
}

# create a random password. This should be sensitive, but using it as string for testing
resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "vmss" {
  source = "../../modules/vmss"
  instance_count = var.instance_count
  location = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id = module.subnet.subnet_id
  vm_admin_name = random_string.username.result
  vm_admin_password = random_string.password.result
  vm_sku_name = var.vm_sku_name
  vmss_name = var.vmss_name
  tags = var.tags
}