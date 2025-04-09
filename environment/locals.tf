locals {
  # Basic naming components
  env_prefix    = var.env_prefix
  project_affix = var.project_affix
  naming_prefix = "${local.env_prefix}${local.project_affix}"

  # Resource naming convention
  resource_names = {
    acr            = "Shr${local.project_affix}Acr"
    storage        = lower("${local.naming_prefix}Sa")
    keyvault       = "${local.naming_prefix}Kv"
    resource_group = "rg-${local.project_affix}-${local.env_prefix}"
    vnet           = "${local.naming_prefix}Vnet"
  }

  # Tags that will be applied to all resources
  common_tags = merge(var.tags, {
    Environment = var.environment
    Project     = local.project_affix
    ManagedBy   = "Terraform"
  })
}