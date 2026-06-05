output "kke_sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.datacenter_sns_topic.arn
}

output "kke_sqs_queue_url" {
  description = "The URL of the SQS queue"
  value       = aws_sqs_queue.datacenter_sqs_topic.id
}