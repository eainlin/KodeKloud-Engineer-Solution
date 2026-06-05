output "KKE_sns_topic_name" {
  value = aws_sns_topic.nautilus_sns.name
}

output "KKE_cloudwatch_alarm_name" {
  value = aws_cloudwatch_metric_alarm.nautilus_cpu_alarm.alarm_name
}