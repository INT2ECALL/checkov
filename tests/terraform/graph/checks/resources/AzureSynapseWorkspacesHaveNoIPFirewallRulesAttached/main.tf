resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "83569b29-99da-4b78-b45e-d17549a8266e"
  }
}

resource "azurerm_synapse_workspace" "workspace_good" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  managed_virtual_network_enabled  = true
  tags = {
    Env       = "production"
    yor_trace = "868798f3-b3f1-48c6-ac3e-c99bb5b32e77"
  }
}

resource "azurerm_synapse_workspace" "workspace_bad" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  tags = {
    Env       = "production"
    yor_trace = "f0a32324-4ae2-494a-b653-3dee05a9dade"
  }
}

resource "azurerm_synapse_firewall_rule" "firewall_rule" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.workspace_bad.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}