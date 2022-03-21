# This setups up the Virtual Machine Scale Set within which VMs get provisioned.

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                 = var.vmss_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  sku                  = var.vm_sku_name
  instances            = var.instance_count
  computer_name_prefix = var.vmss_name

  # authentication preferences
  admin_username                  = var.vm_admin_name
  admin_password                  = var.vm_admin_password
  disable_password_authentication = false

  # Managed Identity
  identity {
    type         = var.identity_type
    identity_ids = var.user_assigned_identities
  }

  # Image properties
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.2"
    version   = "latest"
  }

  # OS disk properties
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  # Data disk properties
  data_disk {
    caching              = "ReadOnly"
    create_option        = "Empty"
    disk_size_gb         = 512
    storage_account_type = "Standard_LRS"
    lun                  = 0
  }

  # Network configuration
  network_interface {
    name    = "${var.vmss_name}-network-interface"
    primary = true

    ip_configuration {
      name      = "${var.vmss_name}-ip-configuration-1"
      primary   = true
      subnet_id = var.subnet_id

      public_ip_address {
        name = "${var.vmss_name}-public-ip"
      }
    }
  }
  tags = var.tags
}
