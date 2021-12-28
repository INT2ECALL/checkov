data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "b1880f6e-225c-48f1-8860-bd187b49ddfd"
  }
}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  tags = {
    yor_trace = "4f67b33c-7fbb-4454-8b9a-8f38bf12f696"
  }
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["get", "create", "delete", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

  depends_on = [
    azurerm_key_vault_access_policy.client
  ]
  tags = {
    yor_trace = "c7571b3a-1403-45c8-bc72-416573458e4c"
  }
}


resource "azurerm_storage_account" "ok_storage_account" {
  name                     = "examplestor"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "cca110ca-4fd4-4fb0-a4fb-7d22d848fa9c"
  }
}

resource "azurerm_storage_account" "not_ok_storage_account" {
  name                     = "examplestor"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "41d96d83-3e39-49cd-ad30-8a73d1c9c319"
  }
}

resource "azurerm_storage_account_customer_managed_key" "ok_cmk" {
  storage_account_id = azurerm_storage_account.ok_storage_account.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
}