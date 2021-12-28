resource "azurerm_kusto_cluster" "cluster_ok" {
  name                = "kustocluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_D13_v2"
    capacity = 2
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "e09ee931-7883-49c9-9691-bdf7deff4944"
  }
}

resource "azurerm_kusto_cluster_customer_managed_key" "example" {
  cluster_id   = azurerm_kusto_cluster.cluster_ok.id
  key_vault_id = azurerm_key_vault.example.id
  key_name     = azurerm_key_vault_key.example.name
  key_version  = azurerm_key_vault_key.example.version
}


resource "azurerm_kusto_cluster" "cluster_ok_not_ok" {
  name                = "kustocluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_D13_v2"
    capacity = 2
  }

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "6b44379a-868e-42d4-aadb-83d4badac1b5"
  }
}