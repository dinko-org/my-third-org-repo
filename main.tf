terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
} /*
provider "azurerm" {
  subscription_id = "55d3be31-4d42-42c1-8129-a75a80d3140b"
  features {}
}
*/
provider "azurerm" {
  use_oidc = true

  resource_provider_registrations = "core"
  features {}
}
