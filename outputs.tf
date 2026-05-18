output "secret_arn" {
  description = "Secret ARN"
  value       = aws_secretsmanager_secret.this.arn
}

output "secret_name" {
  description = "Secret name"
  value       = aws_secretsmanager_secret.this.name
}

output "secret_version_id" {
  description = "Current secret version ID"
  value       = aws_secretsmanager_secret_version.this.version_id
}
