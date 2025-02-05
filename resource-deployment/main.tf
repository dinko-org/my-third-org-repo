module "resource-group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage" {
  source                   = "../modules/storage"
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource-group.name
  location                 = var.location
  tags                     = var.tags
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  container_name           = var.container_name
  automatic_container_name = var.automatic_container_name
}
