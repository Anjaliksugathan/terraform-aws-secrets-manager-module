# Terraform AWS Secrets Manager Module

Reusable Terraform module for securely managing AWS Secrets Manager secrets
on a shared AWS platform.

## Features

- Secure defaults
- AWS Secrets Manager integration
- Optional secret rotation support
- KMS encryption support
- Tagging support
- Validation rules
- CI-ready structure

---

## Usage

```hcl
module "app_secret" {
  source = "..."

  name = "shared/platform/app/db"

  secret_values = var.secret_values
}
```

---

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

### CI/CD Secret Injection

Inject secrets securely through:
- GitHub Actions Secrets
- GitLab CI Variables
- Vault integrations
- AWS SSM Parameter Store

---

## Security Considerations

Although secrets are stored in AWS Secrets Manager,
Terraform state may still contain sensitive values.

Recommended mitigations:
- Use encrypted remote state backends
- Restrict Terraform state access
- Enable state locking
- Avoid local state storage

---

## Rotation Support

This module supports optional AWS Secrets Manager rotation.

Typical production setup:
- Lambda rotation function
- IAM permissions
- Rotation schedule
- Application credential refresh workflow

Example:

```hcl
enable_rotation   = true
rotation_days     = 30
rotation_lambda_arn = aws_lambda_function.rotation.arn
```

---

## Assumptions

- Shared AWS platform with centralized IAM/KMS controls
- Terraform executed from CI/CD or secure developer environments
- Remote state backend configured securely

---

## TODO

- Add resource-based policies
- Add cross-region replication
- Add opinionated rotation submodule
- Add tfsec/checkov integration
- Add automated tests
