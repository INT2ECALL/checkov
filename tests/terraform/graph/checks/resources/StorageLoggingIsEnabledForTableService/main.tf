resource "azurerm_resource_group" "blobExample_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "56b9d6c0-1bde-4a0d-ae65-9d1ccc6596ab"
  }
}

resource "azurerm_log_analytics_workspace" "blobExample_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.blobExample_ok.location
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "174495cf-9f23-4045-80ae-f754b0f2850b"
  }
}

resource "azurerm_storage_account" "blobExample_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_ok.name
  location                 = azurerm_resource_group.blobExample_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "c71c3bcc-7cd6-45a5-810f-2ff7ba064db7"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_ok.id
  storage_account_key = azurerm_storage_account.blobExample_ok.primary_access_key
  table_names         = ["myexampletable_ok"]
  tags = {
    yor_trace = "ae1c5a90-38ba-46c5-a3b6-5b95ff2f24b6"
  }
}

resource "azurerm_storage_table" "blobExample_ok" {
  name                   = "myexampletable_ok"
  storage_account_name   = azurerm_storage_account.blobExample_ok.name
  storage_container_name = azurerm_storage_container.blobExample_ok.name
}


resource "azurerm_storage_account" "blobExample_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "96c73bcb-d48f-4ce2-999c-b8d3b7a19a53"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_not_ok.id
  storage_account_key = azurerm_storage_account.blobExample_not_ok.primary_access_key
  tags = {
    yor_trace = "c080e9c1-b541-4ca0-a57c-a2a2bfd0ad75"
  }
}

resource "azurerm_storage_table" "blobExample_not_ok" {
  name                   = "myexampletable_not_ok"
  storage_account_name   = azurerm_storage_account.blobExample_not_ok.name
  storage_container_name = azurerm_storage_container.blobExample_not_ok.name
}

