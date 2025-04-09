output "container_registry_id" {
  description = "ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "container_registry_login_server" {
  description = "Login server for the container registry"
  value       = azurerm_container_registry.acr.login_server
}