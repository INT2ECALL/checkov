# pass

resource "azurerm_data_factory" "github" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  github_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    git_url         = "https://github.com"
    repository_name = "checkov"
    root_folder     = "/"
  }
  tags = {
    yor_trace = "1ec03639-6259-4721-8434-e8004ac5be58"
  }
}

resource "azurerm_data_factory" "vsts" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  vsts_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    project_name    = "chechov"
    repository_name = "checkov"
    root_folder     = "/"
    tenant_id       = "123456789"
  }
  tags = {
    yor_trace = "b03d16c3-5711-4001-a114-995e7777332d"
  }
}

# fail

resource "azurerm_data_factory" "fail" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    yor_trace = "ff697d25-5e26-47b7-87be-a0efd5f05b09"
  }
}
