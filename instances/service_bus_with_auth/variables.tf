variable "location" {
  type        = string
  description = "The location where the ServiceBus is to be setup."
}

variable "resource_group_name" {
  type = string
}

variable "namespace_name" {
  type        = string
  description = "The name of the ServiceBus namespace."
}

variable "queue_names" {
  type        = list(string)
  default     = []
  description = "The names of the queue."
}

variable "tags" {
  default = {
    "type" : "service_bus"
  }
}