output "id" {
  description = "The virtual NetworkConfiguration ID."
  value       = azurerm_virtual_network.vnet.id
}

output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}