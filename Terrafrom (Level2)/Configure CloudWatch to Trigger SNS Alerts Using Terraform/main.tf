# ---------------------------
# SNS Topic
# ---------------------------
resource "aws_sns_topic" "nautilus_sns" {
  name = "nautilus-sns-topic"
}

# ---------------------------
# CloudWatch Alarm
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "nautilus_cpu_alarm" {
  alarm_name          = "nautilus-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  actions_enabled     = true

  # Link the alarm to the SNS topic for notifications
  alarm_actions = [
    aws_sns_topic.nautilus_sns.arn
  ]
}