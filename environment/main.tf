terraform {
  required_version = ">= 1.0.0"
  backend "azurerm" {}
}

# Create the main resource group
resource "azurerm_resource_group" "main" {
  name     = local.resource_names.resource_group
  location = var.location
  tags     = local.common_tags
}

module "container_registry" {
  source = "./environment/modules/container_registry"

  resource_group_name     = local.resource_names.acr_resource_group
  location                = var.location
  container_registry_name = local.resource_names.acr
  sku                     = var.container_registry_sku
  admin_enabled           = var.container_registry_admin_enabled
  tags                    = local.common_tags

  depends_on = [azurerm_resource_group.main]
}

module "key_vault" {
  source = "./environment/modules/key_vault"

  resource_group_name = local.resource_names.resource_group
  location            = var.location
  key_vault_name      = local.resource_names.keyvault
  sku_name            = var.key_vault_sku
  tags                = local.common_tags

  depends_on = [azurerm_resource_group.main]
}

module "storage" {
  source = "./environment/modules/storage"

  resource_group_name  = local.resource_names.resource_group
  location             = var.location
  storage_account_name = local.resource_names.storage
  account_tier         = var.storage_account_tier
  replication_type     = var.storage_replication_type
  tags                 = local.common_tags

  depends_on = [azurerm_resource_group.main]
}

module "virtual_network" {
  source = "./environment/modules/virtual_network"

  resource_group_name = local.resource_names.resource_group
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_prefixes
  tags                = local.common_tags

  depends_on = [azurerm_resource_group.main]
}