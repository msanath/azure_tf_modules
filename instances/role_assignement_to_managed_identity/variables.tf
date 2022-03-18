variable "managed_identity_name" {
  type = string
  description = "The name of the manged identity to which the role is to be assigned."
}

variable "managed_identity_resource_group_name" {
  type = string
  description = "The resouce group name containing the managed identity."
}

variable "role_def_name" {
  type = string
  description = "A name for this role."
}

variable "data_actions" {
  type = list(string)
  description = "A list of data actions to write data to resources."
}

variable "actions" {
  type = list(string)
  description = "A list of actions to write data to resources."
}