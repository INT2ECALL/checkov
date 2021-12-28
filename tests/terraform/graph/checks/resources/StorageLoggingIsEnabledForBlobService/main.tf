resource "azurerm_resource_group" "resource_group_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "5c7ca23d-770b-4958-b33b-417c86069c2f"
  }
}

resource "azurerm_log_analytics_workspace" "analytics_workspace_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.resource_group_ok.location
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "f0f19729-c954-4203-8b2b-5d204d2fd9b0"
  }
}

resource "azurerm_storage_account" "storage_account_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.resource_group_ok.name
  location                 = azurerm_resource_group.resource_group_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "a9df9639-6b48-4d52-aec2-752542b56b74"
  }
}

resource "azurerm_log_analytics_storage_insights" "analytics_storage_insights_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  workspace_id        = azurerm_log_analytics_workspace.analytics_workspace_ok.id

  storage_account_id   = azurerm_storage_account.storage_account_ok.id
  storage_account_key  = azurerm_storage_account.storage_account_ok.primary_access_key
  blob_container_names = ["blobExample_ok"]
  tags = {
    yor_trace = "bbbb27c7-31c2-4be4-bc84-46ad66a19094"
  }
}

resource "azurerm_storage_container" "storage_container_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_ok.name
  storage_container_name = azurerm_storage_container.storage_container_ok.name
  container_access_type  = "blob"
}


resource "azurerm_storage_account" "storage_account_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "9fce92bd-6bca-4273-9add-a059f75033fe"
  }
}

resource "azurerm_log_analytics_storage_insights" "storage_insights_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.storage_account_not_ok.id
  storage_account_key = azurerm_storage_account.storage_account_not_ok.primary_access_key
  tags = {
    yor_trace = "cffac1b8-1d46-4b7d-97a0-698b06a545b9"
  }
}

resource "azurerm_storage_container" "storage_container_not_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_not_ok.name
  storage_container_name = azurerm_storage_container.storage_container_not_ok.name
  container_access_type  = "blob"
}


