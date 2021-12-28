resource "azurerm_resource_group" "okLegacyExample" {
  name     = "okLegacyExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "4ac201f6-1898-4081-83a6-14157e143b44"
  }
}

resource "azurerm_sql_server" "okLegacyExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okLegacyExample.name
  location                     = azurerm_resource_group.okLegacyExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "4dae3cd1-5d22-4f6d-ba1b-b391f00a6bbf"
  }
}

resource "azurerm_storage_account" "okLegacyExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okLegacyExample.name
  location                 = azurerm_resource_group.okLegacyExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "46e1d8cb-8ed6-4cc2-a208-63bc26d1cf23"
  }
}

resource "azurerm_storage_container" "okLegacyExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okLegacyExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okLegacyExample" {
  resource_group_name = azurerm_resource_group.okLegacyExample.name
  server_name         = azurerm_sql_server.okLegacyExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okLegacyExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okLegacyExample.id
  storage_container_path          = "${azurerm_storage_account.okLegacyExample.primary_blob_endpoint}${azurerm_storage_container.okLegacyExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okLegacyExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "okExample" {
  name     = "okExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "8d4b19cd-3e84-45cb-8388-524aac111f1b"
  }
}

resource "azurerm_mssql_server" "okExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okExample.name
  location                     = azurerm_resource_group.okExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "97a77b04-fedc-4a67-b581-3e69a07150a0"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "022dfcc0-ec73-4401-874f-8d4c2d5e9e5e"
  }
}

resource "azurerm_storage_container" "okExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okExample" {
  resource_group_name = azurerm_resource_group.okExample.name
  server_name         = azurerm_mssql_server.okExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okExample.id
  storage_container_path          = "${azurerm_storage_account.okExample.primary_blob_endpoint}${azurerm_storage_container.okExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "badExample" {
  name     = "database-rg"
  location = "West Europe"
  tags = {
    yor_trace = "f2bb76d0-d6a4-4b10-af15-05b10fabaf29"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "84895377-767e-4681-b73f-45ea18e8bc4d"
  }
}

resource "azurerm_sql_server" "badExample" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.badExample.name
  location                     = azurerm_resource_group.badExample.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.badExample.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.badExample.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = {
    environment = "production"
    yor_trace   = "38d47965-4ef5-4a32-ba8f-d2133bbbe145"
  }
}


resource "azurerm_storage_container" "badExampleNotEnabled" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.badExampleNotEnabled.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "badExampleNotEnabled" {
  resource_group_name = azurerm_resource_group.badExampleNotEnabled.name
  server_name         = azurerm_sql_server.badExampleNotEnabled.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "badExampleNotEnabled" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.badExampleNotEnabled.id
  storage_container_path          = "${azurerm_storage_account.badExampleNotEnabled.primary_blob_endpoint}${azurerm_storage_container.badExampleNotEnabled.name}/"
  storage_account_access_key      = azurerm_storage_account.badExampleNotEnabled.primary_access_key

  recurring_scans {
    enabled                   = false
    email_subscription_admins = false
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}
