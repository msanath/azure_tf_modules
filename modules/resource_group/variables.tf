variable "resource_group_name" {
  type = string
  description = "The name of the resource group."
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