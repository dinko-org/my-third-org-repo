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
}

variable "sku_name" {
  description = "The name of the keyvault SKU offering"
  type = string
}
