variable "location" {
  type        = string
  description = "The location where the EventHub resource is being created."
}

variable "eh_namespace_name" {
  type        = string
  description = "A name for the EventHub namespace."
}

variable "topic_names" {
  type        = list(string)
  description = "A list of topic names to be created."
}

variable "eh_resource_group_name" {
  type        = string
  description = "The name of the resource group where the eventHub resource is to be created."
}

variable "eh_sku_tier" {
  type        = string
  default     = "Basic"
  description = "The SKU tier for the EventHub."
  validation {
    condition = anytrue(
      [
        var.eh_sku_tier == "Basic",
        var.eh_sku_tier == "Standard",
        var.eh_sku_tier == "Premium",
      ]
    )
    error_message = "The value has to be one of Basic, Standard or Premium."
  }
}

variable "retention_days" {
  type        = number
  description = "The number of days for which te data ios to be retained."
}

variable "partition_count" {
  type        = number
  description = "Number of shards on the Event Hub."
}