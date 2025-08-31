module "rg" {
  source = "../../modules/azurerm_resource_group"
  resource_group_name = "k8s-dev-rg"
  location = "central india"
}