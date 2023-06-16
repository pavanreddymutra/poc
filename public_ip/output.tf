output "public_ip_address" {
  description = "Public IP Address"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}
