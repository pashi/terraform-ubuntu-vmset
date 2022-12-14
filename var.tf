variable "name_prefix" {}
variable "dns_domain" {}
variable "location" {}
variable "resource_group_name" {}
variable "vmcount" {}
variable "subnet_id" {}
variable "virtual_machine_size" {}
variable "virtual_machine_admin_username" {}
variable "virtual_machine_admin_public_key" {}
variable "custom_data" { default = null }
