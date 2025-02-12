variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  default = "rg-module-dinkoli"
}

variable "location" {
  description = "The location where the resources will be created."
  default  = "westeurope"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
  default     = "moduledinkolstorage"
}

variable "account_tier" {
  type        = string
  description = "The Tier to use for this storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "The Replication Type to use for this storage account"
  default     = "ZRS"
}

variable "vnet_name" {
  description = "The name of vnet."
  default = "dinko-vnet"
}

variable "vnet_address_space" {
  description = "The address space of the vnet."
  default = ["192.168.0.0/16"]
}

variable "subnet_name" {
  description = "The name of subnet."
  default = "dinko-subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnet."
  default = ["192.168.1.0/24"]
}

variable "kv_name" {
  description = "The name of the keyvault."
  type = string
  default = "mykvdinkotest"
}

variable "secret_permissions" {
  description = "Secret permissions of the KV."
  type = list(string)
  default     = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]
}

variable "storage_permissions" {
  description = "Secret permissions of the KV."
  type = list(string)
  default     = [
    "List" 
]
}
