data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "dinkokvtf" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name
  purge_protection_enabled = false
  enable_rbac_authorization = true

}

resource "azurerm_key_vault_access_policy" "dinkokvap" {
  key_vault_id = azurerm_key_vault.dinkokvtf.id
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
  key_vault_id = azurerm_key_vault.dinkokvtf.id
}

resource "azurerm_role_assignment" "keyvault_secrets_access" {
  scope                = azurerm_key_vault.dinkokvtf.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.azurerm_client_config.current.object_id
}
