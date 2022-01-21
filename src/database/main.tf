variable "server" {
  type = object({
    id                  = string
    name                = string
    resource_group_name = string
    location            = string
  })
}

variable "name" {
  type = string
}

resource "azurerm_postgresql_database" "default" {
  name                = var.name
  resource_group_name = var.server.resource_group_name
  server_name         = var.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "instance" {
  value = azurerm_postgresql_database.default
}
