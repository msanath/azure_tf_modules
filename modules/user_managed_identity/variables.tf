variable "location" {
  type        = string
  description = "The location where the managed identity is to be created."
}

variable "managed_identity_name" {
  type        = string
  description = "A name for the managed identity"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the managed identity is to be created."
}