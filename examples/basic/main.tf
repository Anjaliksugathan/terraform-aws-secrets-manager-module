module "secret" {
  source = "../../"

  name = "prod/app/db"

  secret_values = {
    username = "appuser"
    password = "supersecret"
  }

  tags = {
    Environment = "prod"
  }
}
