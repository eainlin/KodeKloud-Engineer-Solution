output "kke_sns_topic_name" {
  value = aws_sns_topic.xfusion_topic.name
}

output "kke_role_name" {
  value = aws_iam_role.xfusion_role.name
}

output "kke_policy_name" {
  value = aws_iam_policy.xfusion_policy.name
}