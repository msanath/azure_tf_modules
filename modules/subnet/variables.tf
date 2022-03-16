variable "resource_group_name" {
  type = string
  description = "The name of the existing resource group where the VNET is to be provisioned."
}

variable "vnet_name" {
  type = string
  description = "The name of the VNET with which the subnet is to be associated."
}

variable "subnet_name" {
  type = string
  description = "A name for the subnet."
}

variable "address_prefixes" {
  type = list(string)
  description = "A list of address prefixes that need to be provisioned for the vnet."
}
