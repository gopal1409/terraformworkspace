provider "azurerm" {
  version = "2.2.0"
  features {
    
  }
}
  terraform {
      backend "azurerm"{
          resource_group_name = "terraform-storage-rg"
          storage_account_name = "gopalstatestorage"
          container_name = "lab"
          key = "lab01"
      }
  }


locals {
  name = "${var.name}${terraform.workspace}"
  tags = merge(var.tags, {"env"=terraform.workspace,"app"=local.name})
}

resource "azurerm_resource_group" "rg" {
  name = "${local.name}-rg"
  location = var.region
  tags = local.tags
}