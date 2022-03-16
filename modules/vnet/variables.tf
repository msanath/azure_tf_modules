variable "resource_group_name" {
  type = string
  description = "The name of the existing resource group where the VNET is to be provisioned."
}

variable "location" {
  type = string
  description = "The location of the azure region."
}

variable "tags" {
  type    = map(string)
  default = {}
  description = "Any custom tags that needs to be associated with the resource."
}

variable "address_space" {
  type = list(string)
  description = "A list of address spaces that need to be provisioned for the vnet."
}

variable "vnet_name" {
  type = string
  description = "A name for the VNET."
}