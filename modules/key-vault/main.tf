data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "dinkokvtf" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name
  purge_protection_enabled = false

}

resource "azurerm_key_vault_access_policy" "dinkokvap" {
  key_vault_id = azurerm_key_vault.dinkokvtf.id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  # The object_id of the Managed Identity for the VM
  object_id = data.azurerm_client_config.current.object_id
  
  secret_permissions = var.secret_permissions
  
 # storage_permissions = var.storage_permissions

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

data "azuread_user" "sub_owner" {
  user_principal_name = var.user_principal_name
}

# Key Vault Access Policy for User
resource "azurerm_key_vault_access_policy" "user_policy" {
  key_vault_id = azurerm_key_vault.dinkokvtf.id
  tenant_id    = data.azuread_user.sub_owner.tenant_id

  # Grant access to the specific user
  object_id = data.azuread_user.sub_owner.object_id

  secret_permissions  = var.secret_permissions
 }

resource "azurerm_role_assignment" "keyvault_secrets_access_sub_owner" {
  scope                = azurerm_key_vault.dinkokvtf.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.aazuread_user.sub_owner.object_id
}
