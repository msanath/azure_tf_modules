provider "azurerm" {
  features {}
}

resource "azurerm_eventhub_namespace" "eh_namespaces" {
  location            = var.location
  name                = var.eh_namespace_name
  resource_group_name = var.eh_resource_group_name
  sku                 = var.eh_sku_tier
}

resource "azurerm_eventhub" "queue" {

  for_each = toset(var.topic_names)

  message_retention   = var.retention_days
  name                = each.value
  namespace_name      = azurerm_eventhub_namespace.eh_namespaces.name
  partition_count     = var.partition_count
  resource_group_name = var.eh_resource_group_name
}
