variable "location" {
  type        = string
  description = "The location where the instance of event hub is to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group which will be created to host the Event Hub."
}

variable "tags" {
  default = {
    "type" : "event-hub-test"
  }
}

variable "eh_namespaces_name" {
  type        = string
  description = "The name of the EventHub."
}

variable "partition_count" {
  type        = number
  description = "Number of shards on the Event Hub."
}

variable "retention_days" {
  type        = number
  description = "The number of days for which te data ios to be retained."
}

variable "topic_names" {
  type        = list(string)
  description = "The name of the topics for the eventHub."
}