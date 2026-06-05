output "KKE_secret_name" {
  value = aws_secretsmanager_secret.app_secret.name
}

output "KKE_role_name" {
  value = aws_iam_role.app_role.name
}

output "KKE_policy_name" {
  value = aws_iam_role_policy.app_inline_policy.name
}