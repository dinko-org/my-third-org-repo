variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  default = "rg-module-dinkol"
}

variable "location" {
  description = "The location where the resources will be created."
  default  = "westeurope"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
  default     = "moduledinkostorage"
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
