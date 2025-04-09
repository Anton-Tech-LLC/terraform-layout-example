# General
variable "environment" {
  description = "The environment (dev, qa, prod)"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for naming (e.g., Dv, Qa, Pr)"
  type        = string
}

variable "project_affix" {
  description = "A 3-9 letter project affix used for resource naming"
  type        = string
  default     = "Example"
  validation {
    condition     = length(var.project_affix) >= 3 && length(var.project_affix) <= 9
    error_message = "The project_affix value must be between 3 and 9 characters."
  }
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

variable "create_new_resource_groups" {
  description = "Whether to create new resource groups or use existing ones"
  type        = bool
  default     = false
}

# Container Registry
variable "container_registry_name" {
  description = "Name of the container registry"
  type        = string
}

variable "container_registry_sku" {
  description = "SKU for the container registry"
  type        = string
  default     = "Basic"
}

variable "container_registry_admin_enabled" {
  description = "Enable admin user for the container registry"
  type        = bool
  default     = false
}

# Key Vault
variable "key_vault_name" {
  description = "Name of the key vault"
  type        = string
}

variable "key_vault_sku" {
  description = "SKU for the key vault"
  type        = string
  default     = "standard"
}

# Storage
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_tier" {
  description = "Tier for the storage account"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}

# Virtual Network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
  default     = ["subnet1", "subnet2"]
}

variable "subnet_prefixes" {
  description = "CIDR prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}