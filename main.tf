provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "France Central"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  
  sku {
    tier = "Standard"
    size = "S1"
  }

  reserved = true
}

resource "azurerm_app_service" "example" {
  name                = "terraservice"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

 
}