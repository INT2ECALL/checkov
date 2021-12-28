resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "0452d4f3-3a1a-406c-866b-c95ae557a3e5"
  }
}

resource "azurerm_sql_server" "sql_server_good" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "eaa9c070-2078-48a8-a310-9b9f347b7cad"
  }
}

resource "azurerm_sql_server" "sql_server_bad" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "8d80bf2d-a8ce-46be-8b88-eb66e87c9fac"
  }
}


resource "azurerm_sql_firewall_rule" "firewall_rule_good" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.sql_server_good.name
  start_ip_address    = "10.0.17.62"
  end_ip_address      = "10.0.17.62"
}

resource "azurerm_sql_firewall_rule" "firewall_rule_bad" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.sql_server_bad.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
