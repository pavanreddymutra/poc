variable "subnet_name" {
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
  default     = ""
}

variable "subnet_address_space" {
  description = "(Optional / Deprecated in favour of address_prefixes) The address prefix to use for the subnet."
  default     = [" "]
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
  default     = ""
}

variable "vnet_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  default     = ""
}
