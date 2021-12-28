data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = "location"
  resource_group_name = "group"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  tags = {
    yor_trace = "69973d47-5fff-4ad9-a097-06fb6f3baf81"
  }
}

resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  tags = {
    yor_trace = "3fbf6f9d-4e44-40ad-a0bc-2cfe2dc3932b"
  }
}


resource "azurerm_storage_account" "storage_account_good_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "e26123eb-7073-438d-bfc5-c92ff6ab116f"
  }
}

resource "azurerm_storage_account" "storage_account_bad_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "58ad233d-d8b0-4ab0-9b46-20cc34737201"
  }
}

resource "azurerm_storage_account" "storage_account_bad_2" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "b57120a9-0e59-4675-9a99-e9e1330f2d70"
  }
}

resource "azurerm_storage_account_customer_managed_key" "managed_key_good" {
  storage_account_id = azurerm_storage_account.storage_account_good_1.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}


resource "azurerm_storage_account_customer_managed_key" "managed_key_bad_1" {
  storage_account_id = azurerm_storage_account.storage_account_bad_1.id
  key_vault_id       = ""
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}
