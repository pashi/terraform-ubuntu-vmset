output "vmset_name_prefix" {
  value = var.name_prefix
}
output "vmset_dns_domain" {
  value = var.dns_domain
}
output "vmcount" {
  value = var.vmcount
}
output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.*.id
}