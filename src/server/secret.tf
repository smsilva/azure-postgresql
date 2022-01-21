resource "random_password" "server_administrator" {
  length           = 16
  special          = true
  override_special = "_%@"
}
