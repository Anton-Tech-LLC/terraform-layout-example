# General
environment                = "qa"
env_prefix                 = "Qa"
project_affix              = "Example"
location                   = "eastus2"
subscription_id            = "00000000-0000-0000-0000-000000000000"
tenant_id                  = "00000000-0000-0000-0000-000000000000"
create_new_resource_groups = true

# Container Registry
container_registry_name          = "acrterraformexampleqa"
container_registry_sku           = "Basic"
container_registry_admin_enabled = true

# Key Vault
key_vault_name = "kv-terraform-example-qa"
key_vault_sku  = "standard"

# Storage
storage_account_name     = "stterraformexampleqa"
storage_account_tier     = "Standard"
storage_replication_type = "GRS"

# Virtual Network
vnet_name          = "vnet-terraform-example-qa"
vnet_address_space = ["10.1.0.0/16"]
subnet_names       = ["subnet-app", "subnet-data"]
subnet_prefixes    = ["10.1.1.0/24", "10.1.2.0/24"]

# Tags
tags = {
  Environment = "QA"
  Project     = "Terraform Example"
  Owner       = "DevOps Team"
}