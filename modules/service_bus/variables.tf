variable "location" {
  type = string
  description = "The locaiton where the ServiceBus instance is to be created."
}

variable "namespace_name" {
  type = string
  description = "The name of the ServiceBus namespace."
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group where the ServiceBus instance is to be created."
}

variable "sku_tier" {
  type        = string
  default     = "Basic"
  description = "The SKU tier for the ServiceBus."
  validation {
    condition = anytrue(
      [
        var.sku_tier == "Basic",
        var.sku_tier == "Standard",
        var.sku_tier == "Premium",
      ]
    )
    error_message = "The value has to be one of SystemAssigned or UserAssigned."
  }
}

variable "queue_names" {
  type = list(string)
  description = "A list of queue names."
}

variable "tags" {
  default = {}
}