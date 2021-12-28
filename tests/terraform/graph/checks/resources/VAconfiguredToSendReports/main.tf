resource "azurerm_resource_group" "okLegacyExample" {
  name     = "okLegacyExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "883b4637-d4a3-4aea-8cdc-b04cfe56b1e0"
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
    yor_trace = "5ea44661-ee0e-4606-ad79-157a0a0803e1"
  }
}

resource "azurerm_storage_account" "okLegacyExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okLegacyExample.name
  location                 = azurerm_resource_group.okLegacyExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "95a9f69b-42b2-457a-8e80-1957484b8729"
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
    yor_trace = "8312bb4e-fa3d-4a04-bccb-84c8e82d81bb"
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
    yor_trace = "b61c9fb8-8d54-4faa-a004-21d09a74e33d"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "1b307a97-277a-4af6-b66f-487bca19d2b0"
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
    yor_trace = "16726518-2249-4e85-b9b0-980358c7c117"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "35bb2480-4a88-4230-b517-aba71e294419"
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
    yor_trace   = "9cc67ede-0f7e-411e-8c28-1c74f9774322"
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
