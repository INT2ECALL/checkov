data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "7039f666-012b-4a33-aabe-1e1ee90b15af"
  }
}

resource "azurerm_sql_server" "sql_server_good" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "cd5541f2-4c88-4135-8ea2-ff67f69cada7"
  }
}

resource "azurerm_sql_server" "sql_server_bad" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "4c3a9490-6c6f-4ac3-83a0-843aa60954b8"
  }
}

resource "azurerm_sql_active_directory_administrator" "example" {
  server_name         = azurerm_sql_server.sql_server_good.name
  resource_group_name = azurerm_resource_group.example.name
  login               = "sqladmin"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}
