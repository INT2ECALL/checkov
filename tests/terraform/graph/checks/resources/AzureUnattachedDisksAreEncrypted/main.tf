resource "azurerm_resource_group" "group" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "f7f2760d-a961-4702-b9da-987a20edbb42"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings {
    enabled = true
  }
  tags = {
    environment = "staging"
    yor_trace   = "7c9eebfa-098a-4a2f-9026-f6a8a4f9a435"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_2" {
  name                   = "acctestmd"
  location               = "West US 2"
  resource_group_name    = azurerm_resource_group.group.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  disk_encryption_set_id = "12345"
  tags = {
    environment = "staging"
    yor_trace   = "212c072e-628b-478a-9929-e9fbbb7fff0e"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_3" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "9d1077eb-b6ce-4711-96e8-c84d846d21ae"
  }

  encryption_settings {
    enabled = true
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "36769229-35cb-41c3-9902-5fa2fe45cfad"
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_2" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  encryption_settings {
    enabled = false
  }
  tags = {
    environment = "staging"
    yor_trace   = "69b53ef4-4639-4f4a-8d9b-2abb9c3ffd08"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_1.id
  }
  tags = {
    yor_trace = "484c8bfd-d220-4421-b7d5-0013ec18807a"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_2.id
  }
  tags = {
    yor_trace = "31b78fcc-a780-422d-b3db-c2cc42400424"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_good_3" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "managed"
  }
  tags = {
    yor_trace = "385a800d-0b40-4d23-b727-b61cb2716550"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_bad_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_1.id
  }
  tags = {
    yor_trace = "d86c99e7-5c7b-41d8-9423-dfae92d5dc9d"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_bad_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_2.id
  }
  tags = {
    yor_trace = "fb0ab6ab-2921-45df-8405-e94843b0297c"
  }
}