
resource "azurerm_storage_account" "example" {
  name                     = "functionsapptestsa"
  resource_group_name      = azurerm_resource_group.rgsuneeldemo1.name
  location                 = azurerm_resource_group.rgsuneeldemo1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.rgsuneeldemo1.location
  resource_group_name = azurerm_resource_group.rgsuneeldemo1.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_function_app" "example" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.rgsuneeldemo1.location
  resource_group_name        = azurerm_resource_group.rgsuneeldemo1.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}