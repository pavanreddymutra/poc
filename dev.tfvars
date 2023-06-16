#credentials

#resource group
location       = "eastus"
resource_group = "testrg"
#vnet
vnet_name          = "testvnet"
vnet_address_space = "10.0.0.0/16"
#subnet
subnet_name                   = "testsubnet"
subnet_address_prefix         = ["10.0.0.0/24"]
subnet_address_space          = ["10.0.0.0/24"]
subnet_id                     = "test"
#nic
centos_nic_name = "centos-nic"
ubuntu_nic_name = "ubuntu-nic"
nic_name        = "nic"
#pubil ip
ubuntu_public_ip    = "ubuntu-public-ip"
centos_public_ip    = "centos-public-ip"
public_ip_name      = "pip"
resource_group_name = "testrg"
# VMs
admin_username     = "testadmin"
admin_password     = "test@dmin99"
c8vm_name                = "c8.local"
ubvm_name                = "u21.local"
nsg_name                 = "test123"
size = "Standard_DS2_v2"
os_disk_name      = "centos-osdisk"
ubos_disk_name    = "ubuntu-disk"
os_disk_caching   = "ReadWrite"
ubos_disk_caching = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"
centos_image_publisher = "OpenLogic"
centos_image_offer     = "CentOS"
centos_image_sku       = "8_3"
centos_image_version   = "latest"
ubos_disk_storage_account_type = "Standard_LRS"
ubuntu_image_publisher = "Canonical"
ubuntu_image_offer     = "0001-com-ubuntu-server-jammy"
ubuntu_image_sku       = "22_04-lts-gen2"
ubuntu_image_version   = "latest"

#nsg
nsg_rule_name                       = "nsgrule"
nsg_rule_priority                   = 100
nsg_rule_direction                  = "Inbound"
nsg_rule_access                     = "Allow"
nsg_rule_protocol                   = "Tcp"
nsg_source_port_range               = "*"
 nsg_destination_port_range          = "*"
nsg_rule_source_address_prefix      = "*"
nsg_rule_destination_port_range     = "*"
 nsg_rule_source_port_range          = "*"
nsg_network_security_group_name     = "test123"
nsg_rule_destination_address_prefix = "*"
description = "poc"
