output "environment" {
  description = "The environment name"
  value       = var.environment
}

output "container_registry_id" {
  description = "ID of the container registry"
  value       = module.container_registry.container_registry_id
}

output "container_registry_login_server" {
  description = "Login server for the container registry"
  value       = module.container_registry.container_registry_login_server
}

output "key_vault_id" {
  description = "ID of the key vault"
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "URI of the key vault"
  value       = module.key_vault.key_vault_uri
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.storage.storage_account_id
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account"
  value       = module.storage.storage_account_primary_blob_endpoint
}

output "virtual_network_id" {
  description = "ID of the virtual network"
  value       = module.virtual_network.virtual_network_id
}

output "subnet_ids" {
  description = "IDs of the subnets"
  value       = module.virtual_network.subnet_ids
}