locals {
  server_name         = "wasp-telemetry"
  resource_group_name = "wasp-foundation"
}

module "server" {
  source = "../../src/server"

  name                = local.server_name
  resource_group_name = local.resource_group_name
}

output "server_id" {
  value = module.server.instance.id
}

output "server_fqdn" {
  value = module.server.instance.fqdn
}

output "server_admin_user_name" {
  value = module.server.instance.administrator_login
}

output "server_admin_user_password" {
  value     = module.server.instance.administrator_login_password
  sensitive = true
}
