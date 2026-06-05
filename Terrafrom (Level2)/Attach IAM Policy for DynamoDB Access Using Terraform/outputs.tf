output "kke_dynamodb_table" {
  value = aws_dynamodb_table.datacenter_table.name
}

output "kke_iam_role_name" {
  value = aws_iam_role.datacenter_role.name
}

output "kke_iam_policy_name" {
  value = aws_iam_policy.readonly_policy.name
}