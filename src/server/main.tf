variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "server_admin_name" {
  type    = string
  default = "sofia"
}

data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}

resource "azurerm_postgresql_server" "default" {
  name                = var.name
  location            = data.azurerm_resource_group.default.location
  resource_group_name = data.azurerm_resource_group.default.name

  administrator_login          = var.server_admin_name
  administrator_login_password = random_password.server_administrator.result

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

output "instance" {
  value = azurerm_postgresql_server.default
}
