# Terraform Infrastructure as Code Example

This repository contains a modular Terraform configuration for deploying consistent cloud infrastructure across multiple environments. It follows infrastructure-as-code best practices with a focus on reusability, maintainability, and standardized naming conventions.

## Project Structure

```
├── terraform.tf                    # Terraform configuration
├── main.tf                         # Root module that calls all submodules
├── variables.tf                    # Variable definitions for the root module
├── outputs.tf                      # Output definitions for the root module
├── providers.tf                    # Provider configuration
├── locals.tf                       # Local variables and naming conventions
├── environment/
│   └── modules/                    # Reusable infrastructure components
│       ├── container_registry/     # Azure Container Registry module
│       │   ├── main.tf            
│       │   ├── variables.tf       
│       │   └── outputs.tf         
│       ├── key_vault/              # Azure Key Vault module
│       │   ├── main.tf            
│       │   ├── variables.tf       
│       │   └── outputs.tf         
│       ├── storage/                # Azure Storage module
│       │   ├── main.tf            
│       │   ├── variables.tf       
│       │   └── outputs.tf         
│       └── virtual_network/        # Azure Virtual Network module
│           ├── main.tf            
│           ├── variables.tf       
│           └── outputs.tf         
├── variables/                      # Environment-specific variables
│   ├── dev.tfvars                  # Development environment variables
│   ├── qa.tfvars                   # QA environment variables
│   └── prod.tfvars                 # Production environment variables
└── github/
    └── workflows/                  # CI/CD configuration
        └── deploy.yml              # GitHub Actions workflow for deployment
```

## Core Design Principles

### 1. Consistent Resource Naming

The project uses a standardized naming convention for all resources, defined in `locals.tf`. The naming pattern follows this structure:

```
{environment_prefix}{project_name}{resource_type}
```

For example:
- `DvExampleKv` for a Key Vault in the Development environment
- `QaExampleVnet` for a Virtual Network in the QA environment
- `PrExampleSa` for a Storage Account in the Production environment

This consistent naming helps with:
- Resource identification across environments
- Compliance with organizational naming policies
- Automation and scripting

### 2. Environment Separation

The infrastructure is designed to be deployed to multiple environments (Development, QA, Production) with environment-specific configurations:

- Each environment has its own `.tfvars` file in the `variables/` directory
- Environment-specific variables include resource SKUs, replication types, and other settings
- The CI/CD pipeline can target specific environments using these variable files

### 3. Modular Architecture

The infrastructure is divided into reusable modules:

- **Container Registry**: For storing and managing container images
- **Key Vault**: For secrets management
- **Storage**: For blob, file, and other storage needs
- **Virtual Network**: For network isolation and segmentation

Each module:
- Has its own input variables, resources, and outputs
- Is designed to be reusable across different projects
- Has consistent parameter names and resource handling

### 4. Resource Group Management

Resource groups are managed at the root level:

- A main resource group for environment-specific resources
- An optional shared resource group for resources that might be shared across environments

The creation of resource groups can be controlled via variables:
- `create_new_resource_groups`: Controls whether to create the main resource group
- `create_shared_resources`: Controls whether to create the shared resource group

### 5. Tagging Strategy

All resources are tagged with a consistent set of tags defined in `locals.tf`:

- Environment
- Project
- Owner
- ManagedBy = "Terraform"

Additional tags can be added via the `tags` variable in each environment's `.tfvars` file.

## Usage

### Prerequisites

- Terraform >= 1.0.0
- Azure CLI
- GitHub account (for CI/CD)

### Local Deployment

1. Initialize Terraform with the appropriate backend configuration:

```bash
terraform init -backend-config=./environment/backend/dev.tfbackend
```

2. Plan the deployment using the appropriate variable file:

```bash
terraform plan -var-file=./variables/dev.tfvars
```

3. Apply the changes:

```bash
terraform apply -var-file=./variables/dev.tfvars
```

### CI/CD Deployment

The repository includes a GitHub Actions workflow in `.github/workflows/deploy.yml` that:

1. Runs on pushes to the main branch and pull requests
2. Initializes Terraform with the appropriate backend configuration
3. Validates the formatting of the Terraform files
4. Plans and applies the changes for each environment
5. Uses environment-specific variable files

## Extending the Project

### Adding a New Module

1. Create a new directory under `environment/modules/`
2. Add `main.tf`, `variables.tf`, and `outputs.tf`
3. Add the module to `main.tf` in the root directory
4. Add module-specific variables to `variables.tf` in the root directory
5. Add module outputs to `outputs.tf` in the root directory

### Adding a New Environment

1. Create a new `.tfvars` file in the `variables/` directory
2. Add the environment to the matrix in `.github/workflows/deploy.yml`
3. Create a new backend configuration file in `environment/backend/`

## Best Practices

1. Run `terraform fmt -recursive` before committing changes to ensure consistent formatting
2. Use the naming conventions defined in `locals.tf` for all resources
3. Always use the `.tfvars` files for environment-specific configuration
4. Add appropriate tags to all resources
5. Use the modular structure to promote reuse and maintainability