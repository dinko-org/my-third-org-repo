variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
}

variable "location" {
  description = "The location where the resources will be created."
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "account_tier" {
  type        = string
  description = "The Tier to use for this storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "The Replication Type to use for this storage account"
  default     = "GRS"
}
