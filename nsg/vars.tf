variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Network Security Group. Changing this forces a new resource to be created."
  default     = ""
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = ""
}

variable "nsg_name" {
  description = "(Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."
  default     = ""
}

variable "nsg_count" {
  description = "(Required)Number of NSG's to create"
  default     = "1"
}
