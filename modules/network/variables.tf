variable "vnet_name" {
  description = "The name of the vnet."
  type = string
}

variable "vnet_address_space" {
  description = "The address space that is used by the virtual network."
  type = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type = string
}

variable "subnet_address_prefixes" {
  description = "The address prefix to use for the subnet."
  type = list(string)
}
variable "location" {
  type = string
  description = "The location/region where the vnet should be created"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to create vnet"
}
