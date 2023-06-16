module "resource_group" {
  source         = "./rg"
  resource_group = var.resource_group
  location       = var.location
}
module "vnet" {
  source              = "./vnet"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
  location            = var.location
  vnet_address_space  = var.vnet_address_space
}
module "subnet" {
  source               = "./subnet"
  subnet_name          = var.subnet_name
  resource_group_name  = module.resource_group.name
  vnet_name            = module.vnet.name
  subnet_address_space = var.subnet_address_prefix
}
module "nsg" {
  source              = "./nsg"
  nsg_name            = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name
}
module "nsg_rule" {
  source                              = "./nsg_rules"
  resource_group_name                 = module.resource_group.name
  nsg_rule_name                       = var.nsg_rule_name
  nsg_rule_priority                   = var.nsg_rule_priority
  nsg_rule_direction                  = var.nsg_rule_direction
  nsg_rule_access                     = var.nsg_rule_access
  nsg_rule_protocol                   = var.nsg_rule_protocol
  nsg_rule_source_port_range          = var.nsg_rule_source_port_range
  nsg_rule_destination_port_range     = var.nsg_rule_destination_port_range
  nsg_rule_source_address_prefix      = var.nsg_rule_source_address_prefix
  nsg_network_security_group_name     = module.nsg.nsg_name[0]
  nsg_rule_destination_address_prefix = var.nsg_rule_destination_address_prefix
}
module "centos_nic" {
  source              = "./nic"
  nic_name            = var.centos_nic_name
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id = module.subnet.subnet_id
  public_ip_address_id = module.centos_public_ip.public_ip_id
  tags = {
    group = "frontend"
  }

}



module "centos_public_ip" {
  source              = "./public_ip"
  public_ip_name      = var.centos_public_ip
  resource_group_name = module.resource_group.name
  location            = var.location
    tags = {
    group = "frontend"
  }
}
module "ubuntu_nic" {
  source              = "./nic"
  nic_name            = var.ubuntu_nic_name
  location            = var.location
  resource_group_name = module.resource_group.name
  public_ip_address_id = module.ubuntu_public_ip.public_ip_id

  subnet_id = module.subnet.subnet_id
  tags = {
    group = "backend"
  }

}
module "ubuntu_public_ip" {
  source              = "./public_ip"
  public_ip_name      = var.ubuntu_public_ip
  location            = var.location
  resource_group_name = module.resource_group.name
 tags = {
    group = "backend"
  }
}
module "centos_vm" {
  source    = "./vm"
  vm_name = var.c8vm_name
  location  = var.location
  resource_group = module.resource_group.name
  size           = var.size

  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = module.centos_nic.nic_id
  c8network_interface_ids = [module.centos_nic.nic_id]

  os_disk_name                 = var.os_disk_name
  os_disk_caching              = var.os_disk_caching
  os_disk_storage_account_type = var.os_disk_storage_account_type

  image_publisher = var.centos_image_publisher
  image_offer     = var.centos_image_offer
  image_sku       = var.centos_image_sku
  image_version   = var.centos_image_version
  tags = {
    group = "frontend"
  }
}
module "ubuntu_vm" {
  source    = "./vm"
  vm_name = var.ubvm_name
  location  = var.location
  resource_group = module.resource_group.name
  size           = var.size

  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = module.ubuntu_nic.nic_id
  c8network_interface_ids = [module.ubuntu_nic.nic_id]

  os_disk_name                 = var.ubos_disk_name
  os_disk_caching              = var.ubos_disk_caching
  os_disk_storage_account_type = var.ubos_disk_storage_account_type

  image_publisher = var.ubuntu_image_publisher
  image_offer     = var.ubuntu_image_offer
  image_sku       = var.ubuntu_image_sku
  image_version   = var.ubuntu_image_version
  tags = {
    group = "backend"
  }
}



resource "null_resource" "ansible_hostfile" {
  provisioner "local-exec" {
    command = <<-EOT
    echo [frontend] > ansible/hosts  && az network public-ip list --resource-group  ${module.resource_group.name} --query [?tags.group=='frontend'].ipAddress --output tsv >> ansible/hosts &&     echo [backend] >> ansible/hosts  && az network public-ip list --resource-group  ${module.resource_group.name} --query [?tags.group=='backend'].ipAddress --output tsv >>ansible/hosts
  EOT
  }
depends_on = [
    module.resource_group,
    module.ubuntu_public_ip,
    module.centos_public_ip,
    module.centos_vm,
    module.ubuntu_vm
  ]
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = module.subnet.subnet_id
  network_security_group_id = module.nsg.nsg_id[0]
}