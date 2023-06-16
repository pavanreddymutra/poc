
resource "azurerm_resource_group" "testrg" {
  name = var.resource_group
  location = var.location
}
