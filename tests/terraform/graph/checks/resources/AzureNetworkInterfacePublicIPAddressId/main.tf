resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "674cfbd3-d09d-4098-9ab6-7e502e350c62"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    yor_trace = "26a664a0-22a9-4cdd-8e74-fbb5ef6a8c77"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "good" {
  name                = "good-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    yor_trace = "7a8177ea-e0e0-4632-a224-5e32900c430f"
  }
}


resource "azurerm_network_interface" "bad" {
  name                = "bad-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bad.id
  }
  tags = {
    yor_trace = "33112de8-39f7-4ca4-8d6a-ee1ba88f41b4"
  }
}

resource "azurerm_public_ip" "bad" {
  name                = "bad"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
    yor_trace   = "69d30c2a-ef53-4954-8f81-563a1951719a"
  }
}
