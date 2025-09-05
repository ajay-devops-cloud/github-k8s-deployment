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
module "stg" {
  source = "../../modules/azurerm_storage_account"
  storage_account_name = "k8storageact"
  location = "central india"
  resource_group_name = "k8s-dev-rg"
  account_replication_type = "LRS"
  account_tier = "Standard"
  tags = local.common_tags
}