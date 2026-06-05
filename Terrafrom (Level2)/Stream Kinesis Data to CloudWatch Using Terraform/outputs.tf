output "kke_kinesis_stream_name" {
  description = "The name of the Kinesis stream"
  value       = aws_kinesis_stream.xfusion_stream.name
}

output "kke_kinesis_alarm_name" {
  description = "The name of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.kinesis_alarm.alarm_name
}