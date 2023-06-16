resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group
  size                = var.size

  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false


  network_interface_ids = var.c8network_interface_ids
  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }
  

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version

  }
}
