resource "azurerm_sql_server" "sql_server_good_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "23b80cac-710c-423c-b735-9228cbec2ca8"
  }
}

resource "azurerm_sql_server" "sql_server_good_2" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "dfeb74a0-93f6-46cc-9ffc-4f553e11eef6"
  }
}

resource "azurerm_sql_server" "sql_server_bad_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "8ad4007a-e5ff-46b3-afb6-16cc3cb44842"
  }
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_good" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_good_1.name
  state               = "Enabled"
  retention_days      = 20
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_bad" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_bad_1.name
  state               = "Disabled"
  retention_days      = 20
}