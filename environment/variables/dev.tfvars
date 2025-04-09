# General
environment                = "dev"
env_prefix                 = "Dv"
project_affix              = "Example"
location                   = "eastus"
subscription_id            = "00000000-0000-0000-0000-000000000000"
tenant_id                  = "00000000-0000-0000-0000-000000000000"
create_new_resource_groups = true

# Container Registry
container_registry_name          = "acrterraformexampledev"
container_registry_sku           = "Basic"
container_registry_admin_enabled = true

# Key Vault
key_vault_name = "kv-terraform-example-dev"
key_vault_sku  = "standard"

# Storage
storage_account_name     = "stterraformexampledev"
storage_account_tier     = "Standard"
storage_replication_type = "LRS"

# Virtual Network
vnet_name          = "vnet-terraform-example-dev"
vnet_address_space = ["10.0.0.0/16"]
subnet_names       = ["subnet-app", "subnet-data"]
subnet_prefixes    = ["10.0.1.0/24", "10.0.2.0/24"]

# Tags
tags = {
  Environment = "Development"
  Project     = "Terraform Example"
  Owner       = "DevOps Team"
}