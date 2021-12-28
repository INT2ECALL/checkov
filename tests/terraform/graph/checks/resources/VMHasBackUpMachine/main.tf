
resource "azurerm_virtual_machine" "example_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "3a2521b1-e848-480d-9521-61fbd0997002"
  }
}

resource "azurerm_backup_protected_vm" "vm_protected_backup" {
  resource_group_name = azurerm_resource_group.example_ok.name
  recovery_vault_name = azurerm_recovery_services_vault.example_ok.name
  source_vm_id        = azurerm_virtual_machine.example_ok.id
  backup_policy_id    = azurerm_backup_policy_vm.example_ok.id
  tags = {
    yor_trace = "28932060-ca3a-4ca6-afc2-b2f28efd6a68"
  }
}


resource "azurerm_virtual_machine" "example_not_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "4757a395-2389-4a0e-a2d5-6e4f3892e310"
  }
}
