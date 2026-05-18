Top section
# Terraform AWS Secrets Manager Module

Reusable Terraform module for securely managing AWS Secrets Manager secrets
on a shared AWS platform.

## Features

- Secure defaults
- Runtime secret injection
- KMS encryption support
- Optional rotation support
- Replica region support
- Resource policy support
- CI-ready structure
- Terraform validation support
Usage section
## Usage

```hcl
module "app_secret" {
  source = "..."

  name = "shared/platform/app/db"

  secret_values = var.secret_values

  replica_regions = [
    "eu-central-1"
  ]
}
```
Secure injection section (VERY IMPORTANT)
## Secure Secret Injection

Secrets should NEVER be committed to Git.

Recommended approaches:

### Environment Variables

```bash
export TF_VAR_secret_values='{
  "username":"admin",
  "password":"super-secret"
}'
```

### CI/CD Injection

Inject secrets securely through:
- GitHub Actions Secrets
- GitLab CI Variables
- Vault integrations
- AWS SSM Parameter Store
Security section (CRITICAL)
## Security Considerations

Although secrets are stored in AWS Secrets Manager,
Terraform state may still contain secret values.

Recommended mitigations:
- encrypted remote state backend
- restricted IAM access
- state locking
- dedicated Terraform execution roles
- SSE-KMS encrypted S3 backend

Secrets must never be committed to:
- Git
- tfvars files
- CI logs

This is VERY important for a security company. Community discussions repeatedly warn that Terraform state can still expose secrets.

Rotation section
## Rotation Support

The module supports optional AWS Secrets Manager rotation.

Typical production setup:
- Lambda rotation function
- IAM permissions
- Rotation schedules
- Application credential refresh workflow

Rotation is intentionally optional to avoid over-opinionated defaults.
Design decisions section (VERY SENIOR)
## Design Decisions

- Runtime secret injection instead of Git-managed secrets
- Generic map(string) interface for flexibility
- Optional rotation support
- Replica region support for DR scenarios
- ignore_changes used to prevent accidental secret overwrites
TODO section
## TODO

- Add automatic secret generation
- Add opinionated Lambda rotation submodule
- Add Terratest coverage
- Add cross-account access templates
- Add tfsec/checkov enforcement
