resource "azurerm_data_factory" "data_factory_good" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "44b0553c-3c0a-4b13-a98c-8511888e0543"
  }
}

resource "azurerm_data_factory" "data_factory_bad" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "f82d93dc-2ea4-4448-b57a-fd6e10f2c448"
  }
}

resource "azurerm_data_factory_linked_service_key_vault" "factory_good" {
  name                = "example"
  resource_group_name = "example"
  data_factory_name   = azurerm_data_factory.data_factory_good.name
  key_vault_id        = "123456"
}