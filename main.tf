resource "azurerm_network_interface" "vm" {
  name = format("nic-vm-%s%03d", var.name_prefix, count.index +1 )
  location = var.location
  count = var.vmcount
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "vm"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = format("vm-%s%03d", var.name_prefix, count.index +1)
  count = var.vmcount
  resource_group_name = var.resource_group_name
  location = var.location
  size = var.virtual_machine_size
  admin_username = var.virtual_machine_admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.virtual_machine_admin_username
    public_key = var.virtual_machine_admin_public_key
  }

  network_interface_ids = [
    azurerm_network_interface.vm[count.index].id,
  ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts-gen2"
    version = "latest"
  }
  identity {
    type = "SystemAssigned"
  }
}