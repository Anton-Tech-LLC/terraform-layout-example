# General
environment                = "prod"
env_prefix                 = "Pd"
project_affix              = "Example"
location                   = "westus2"
subscription_id            = "00000000-0000-0000-0000-000000000000"
tenant_id                  = "00000000-0000-0000-0000-000000000000"
create_new_resource_groups = false

# Container Registry
container_registry_name          = "acrterraformexampleprod"
container_registry_sku           = "Premium"
container_registry_admin_enabled = false

# Key Vault
key_vault_name = "kv-terraform-example-prod"
key_vault_sku  = "premium"

# Storage
storage_account_name     = "stterraformexampleprod"
storage_account_tier     = "Standard"
storage_replication_type = "RAGRS"

# Virtual Network
vnet_name          = "vnet-terraform-example-prod"
vnet_address_space = ["10.2.0.0/16"]
subnet_names       = ["subnet-app", "subnet-data", "subnet-gateway"]
subnet_prefixes    = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]

# Tags
tags = {
  Environment = "Production"
  Project     = "Terraform Example"
  Owner       = "DevOps Team"
}