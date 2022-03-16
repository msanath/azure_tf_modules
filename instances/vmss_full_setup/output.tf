output "vm_admin_name" {
  value = random_string.username.result
}

output "vm_admin_password" {
  value = random_string.password.result
}

output "vmss_id" {
  value = module.vmss.vmss_id
}