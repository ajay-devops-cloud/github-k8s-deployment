locals { 
  common_tags = {
   "managed_by" = "terraform"
    "Owner" = "ajay"
    "environment" = "dev"
}
}

module "rg" {
  source = "../../modules/azurerm_resource_group"
  resource_group_name = "k8s-dev-rg"
  location = "central india"
  tags = local.common_tags
}

module "aks" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_aks"
  aks_name = "k8s-dev-aks"
   resource_group_name = "k8s-dev-rg"
  location = "central india"
  dns_prefix = "aks-dev-todoapp"
  tags = local.common_tags
}
module "acr" {
  source = "../../modules/azurerm_container_registry"
  acr_name = "rk8sacr"
     resource_group_name = "k8s-dev-rg"
  location = "central india"
  tags = local.common_tags

}
module "sql_server" {
  source = "../../modules/azurerm_sql_server"
   resource_group_name = "k8s-dev-rg"
  location = "central india"
  administrator_login = "devops123"
  administrator_login_password = "Devops@12345"
  sql_server_name = "dev-sql-server"
  sql_version = "12.0"
}
module "sql_database" {
  source = "../../modules/azurerm_sql_database"
  sql_database_name = "dev-database"
     resource_group_name = "k8s-dev-rg"
  location = "central india"
  server_id= module.sql_server.sql_server
}