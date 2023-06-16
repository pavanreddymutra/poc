

resource "azurerm_network_security_group" "nsg" {
  # count               = var.nsg_count
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  lifecycle {
    create_before_destroy = true
  }
}

