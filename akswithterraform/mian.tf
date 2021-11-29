terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "f52cf-8807-4542-a99e-70b12361d"
}
resource "azurerm_resource_group" "resoursegroup" {
  name = "recursosabc"
  location = "eastus"
}
