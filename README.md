# Terraform AWS Secrets Manager Module

A reusable Terraform module for securely managing AWS Secrets Manager secrets.

## Features

- Secure defaults
- Simple interface
- JSON secret support
- Tagging support
- Extensible design

## Example

```hcl
module "secret" {
  source = "..."

  name = "prod/app/db"

  secret_values = {
    username = "appuser"
    password = "supersecret"
  }
}
