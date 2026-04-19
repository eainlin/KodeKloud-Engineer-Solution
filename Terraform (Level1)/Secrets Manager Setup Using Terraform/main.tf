resource "aws_secretsmanager_secret" "datacenter-secret" {
  name = "datacenter-secret"
}

resource "aws_secretsmanager_secret_version" "nautilus_secret_version" {
  secret_id     = aws_secretsmanager_secret.datacenter-secret.id
  secret_string = jsonencode({
    username = "admin",
    password = "Namin123"
  })
}