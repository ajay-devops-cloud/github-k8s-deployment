
resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login 
  administrator_login_password = var.administrator_login_password
}