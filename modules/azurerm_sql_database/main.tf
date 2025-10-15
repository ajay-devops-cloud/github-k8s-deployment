resource "azurerm_mssql_database" "sql_db" {
  name                = var.sql_database_name
   max_size_gb    = 4
  sku_name       = "S0"
  server_id         = var.server_id
}