variable "kv_name" {
  description = "The name of the keyvault."
  type = string
}

variable "location" {
  description = "The name of the keyvault."
  type = string
}

variable "secret_permissions" {
  description = "Secret permissions of the KV."
  type = list(string)
 }

variable "storage_permissions" {
  description = "Secret permissions of the KV."
  type = list(string)
 }

variable "sku_name" {
  description = "The name of the keyvault SKU offering"
  type = string
}

variable "resource_group_name" {
  description = "The name of the rg where keyvault will be created"
  type = string
}
