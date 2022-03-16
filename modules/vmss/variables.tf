variable "vmss_name" {
  type = string
  description = "A name for the VMSS."
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group where the VMSS is to be placed."
}

variable "location" {
  type = string
  description = "The location where the VMSS is to be placed."
}

variable "vm_sku_name" {
  type = string
  description = "The name of the VM SKU which is to be used for provisioning."
}

variable "instance_count" {
  type = number
  description = "The number of VM instances for the VMSS."
}

variable "vm_admin_name" {
  type = string
  description = "The name of the VM admin"
}

variable "vm_admin_password" {
  type = string
  description = "A password string. These modules are for testing only, so using a string password. DO NOT use in production."
}

variable "subnet_id" {
  type = string
  description = "The ID of the subnet which is to be used by the VMSS."
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "identity_type" {
  type = string
  default = "SystemAssigned"
  description = "The type of managed identity to use for the VMSS."
  validation {
    condition = anytrue(
      [ var.identity_type == "SystemAssigned",
        var.identity_type == "UserAssigned"
      ]
    )
    error_message = "The value has to be one of SystemAssigned or UserAssigned."
  }
}

variable "user_assigned_identities" {
  type = list(string)
  default = []
  description = "A list of user assigned identities."
}