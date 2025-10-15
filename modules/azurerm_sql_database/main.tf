resource "azurerm_mssql_database" "sql_db" {
  name                = var.sql_database_name
  sku_name       = "Basic"           # ✅ Basic supports up to 2GB
  max_size_gb    = 2
  server_id         = var.server_id
}