terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {
    }
}

#criação na pasta no az 
resource "azurerm_resource_group" "rg-atividadeterra" {
  name     = "atividadeterraform"
  location = "brazilsouth"
}


