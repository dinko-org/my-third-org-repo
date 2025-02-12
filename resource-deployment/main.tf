module "resource-group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
}

module "storage" {
  source                   = "../modules/storage"
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource-group.name
  location                 = var.location
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
}

module "network" {
  source                   = "../modules/network"
  resource_group_name      = module.resource-group.name
  location                 = var.location
  vnet_name                = var.vnet_name
  vnet_address_space       = var.vnet_address_space
  subnet_name              = var.subnet_name
  subnet_address_prefixes  = var.subnet_address_prefixes
}

module "key-vault" 
{
  source   = "../modules/key-vault"
  name     = var.kv_name
  location = var.location
  resource_group_name      = module.resource-group.name
  sku = var.sku_name
  secret_permissions = var.secret_permissions
  storage_permissions = var.storage_permissions
}
