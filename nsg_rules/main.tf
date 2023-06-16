
resource "azurerm_network_security_rule" "nsg_rule" {
  name                   = var.nsg_rule_name
  priority               = var.nsg_rule_priority
  direction              = var.nsg_rule_direction
  access                 = var.nsg_rule_access
  protocol               = var.nsg_rule_protocol
  source_port_range      = var.nsg_rule_source_port_range
  destination_port_range = var.nsg_rule_destination_port_range
  # source_address_prefixes      = var.nsg_rule_access == "Allow" ? var.nsg_rule_source_address_prefixes : null
  source_address_prefix       = var.nsg_rule_source_address_prefix
  destination_address_prefix  = var.nsg_rule_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_network_security_group_name
  description                 = var.description
}
