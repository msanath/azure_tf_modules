variable "location" {
  type = string
  description = "The location where all the resources are to be created."
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group where all resources are setup."
}

variable "vnet_name" {
  type = string
  description = "The name of the VNET."
}

variable "address_space" {
  type = list(string)
  description = "A list of addresses for the VNET"
}

variable "subnet_name" {
  type = string
  description = "The name of the subnet."
}

variable "instance_count" {
  type = number
  description = "The number of instances in the VMSS."
}

variable "vm_sku_name" {
  type = string
  description = "The VM SKU for the VMSS"
}

variable "vmss_name" {
  type = string
  description = "The name of the VMSS."
}

variable "tags" {
  default = {
    "type": "full_vmss_setup"
  }
}

variable "subnet_prefixes" {
  type = list(string)
  description = "A list of address prefixes that need to be provisioned for the vnet."
}