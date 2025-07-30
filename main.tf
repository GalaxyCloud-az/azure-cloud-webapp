provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_cli = true
}
 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
 
resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type            = "Linux"
  sku_name           = "B1"
}
 
resource "azurerm_app_service" "webapp" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.plan.id
  site_config {
    always_on = true
    linux_fx_version = "DOCKER|mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
  }
}
 
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
 
resource "azurerm_application_insights" "insights" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}