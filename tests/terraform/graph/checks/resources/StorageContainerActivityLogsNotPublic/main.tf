resource "azurerm_storage_container" "ok_container_1" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_1.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "ok_container_2" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_2.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "not_ok_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.not_ok_account.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "ok_account_1" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "b8c78cd3-a44c-4006-b1c0-2540776f6bb8"
  }
}

resource "azurerm_storage_account" "ok_account_2" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "27d21eb7-ab76-4fc7-84f4-926d86b10cbf"
  }
}

resource "azurerm_storage_account" "not_ok_account" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "564aa7d5-1051-4048-b8ce-6ac678bdb2a2"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_1" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."

  criteria {
    resource_id    = azurerm_storage_account.ok_account_1.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "beff966d-1149-4328-83af-28d113ab5b6a"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_2" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = true

  criteria {
    resource_id    = azurerm_storage_account.ok_account_2.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "d11b8a31-c27c-45b7-9e23-eb60a8b05575"
  }
}

resource "azurerm_monitor_activity_log_alert" "not_ok_monitor_activity_log_alert" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = false

  criteria {
    resource_id    = azurerm_storage_account.not_ok_account.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "5d56f67f-4cd5-4fde-9c27-6b6eaaaa1966"
  }
}