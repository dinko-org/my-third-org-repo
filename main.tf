terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
} /*
provider "azurerm" {
  use_oidc = true
  features {}
}

backend "azurerm" {
    key      = "terraform.tfstate"
    use_oidc = true
  }
