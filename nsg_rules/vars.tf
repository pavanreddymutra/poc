variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created."
  default     = ""
}

variable "nsg_network_security_group_name" {
  description = " (Required) The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."

}

variable "nsg_rule_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created."
  default     = ""
}

variable "nsg_rule_priority" {
  description = "(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
  default     = ""
}

variable "nsg_rule_direction" {
  description = "(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
  default     = ""
}

variable "nsg_rule_access" {
  description = "(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
  default     = ""
}

variable "nsg_rule_protocol" {
  description = "(Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, or * (which matches all)."
  default     = ""
}

variable "nsg_rule_source_port_range" {
  description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
  default     = "*"
}

variable "nsg_rule_destination_port_range" {
  description = "(Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
  default     = ""
}

variable "nsg_rule_source_address_prefixes" {
  description = "(Optional) List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified."
  default     = [""]
}

variable "nsg_rule_source_address_prefix" {
  description = "(Optional) CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if source_address_prefixes is not specified."
  default     = ""
}

variable "nsg_rule_destination_prefix" {
  description = "(Optional) List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified."
  default     = ""
}
variable "description" {
  description = "(Optional) Description of NSG rule"
  default     = ""
}

variable"nsg_rule_destination_address_prefix"{

}
