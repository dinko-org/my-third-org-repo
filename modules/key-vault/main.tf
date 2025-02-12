data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "dinkokv" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

}

resource "azurerm_key_vault_access_policy" "dinkokvap" {
  key_vault_id = azurerm_key_vault.dinkokv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  # The object_id of the Managed Identity for the VM
  object_id = data.azurerm_client_config.current.object_id
  
  secret_permissions = var.secret_permissions
  
  storage_permissions = var.storage_permissions

}

resource "random_password" "windows_admin" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "windows_password" {
  name         = "windows-vm-password"
  value        = random_password.windows_admin.result
  key_vault_id = azurerm_key_vault.dinkokv.id
}
  principal_id         = data.azurerm_client_config.current.object_id

}
