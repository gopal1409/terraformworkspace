provider "azurerm" {
  version = "2.2.0"
  features {
    
  }
  terraform {
      backend "azurerm"{
          resource_group_name = "terraform-storage-rg"
          storage_account_name = "gopalstatestorage"
          container_name = "lab"
          key = "lab01"
      }
  }
}