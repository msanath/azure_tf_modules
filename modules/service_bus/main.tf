resource "azurerm_servicebus_namespace" "namespace" {
  location            = var.location
  name                = var.namespace_name
  resource_group_name = var.resource_group_name
  sku                 = var.sku_tier
  tags                = var.tags
}

resource "azurerm_servicebus_queue" "queue" {
  for_each = toset(var.queue_names)

  name                = each.value
  namespace_id        = azurerm_servicebus_namespace.namespace.id
  enable_partitioning = var.sku_tier == "Premium" ? true : false
  enable_express      = var.sku_tier == "Premium" ? true : false
}