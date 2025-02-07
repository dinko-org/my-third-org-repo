resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = outputs.rg.location
  resource_group_name = outputs.rg.name
}

resource "azurerm_subnet" "mysubnet" {
  name                 = var.subnet_name
  resource_group_name  = outputs.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.subnet_address_prefixes
}
