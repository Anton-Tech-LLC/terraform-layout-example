output "key_vault_id" {
  description = "ID of the key vault"
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "URI of the key vault"
  value       = azurerm_key_vault.kv.vault_uri
}