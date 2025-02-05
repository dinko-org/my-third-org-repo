resource "azurerm_storage_account" "example" {
  name                     = "dinkostoragevm"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "testing"
  }
}

resource "azurerm_storage_container" "vm_files" {
  name = "vm-directory"
  #S storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
  #storage_account_name  = azurerm_storage_account.example.name
  storage_account_id = azurerm_storage_account.example.id

}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  name                = "storage-private-endpoint"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.private_endpoints_subnet.id

  private_service_connection {
    name                           = "storage-private-service-connection"
    private_connection_resource_id = azurerm_storage_account.example.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

}