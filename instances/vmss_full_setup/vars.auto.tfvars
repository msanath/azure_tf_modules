location = "westus"
resource_group_name = "full_vmss_setup"
vnet_name = "full_vmss_setup_vmss"
address_space = ["10.0.0.0/24"]
subnet_prefixes = ["10.0.0.0/28"]
subnet_name = "full_vmss_setup_subnet"
instance_count = 1
vm_sku_name = "Standard_DS1_v2"
vmss_name = "vmss-test"