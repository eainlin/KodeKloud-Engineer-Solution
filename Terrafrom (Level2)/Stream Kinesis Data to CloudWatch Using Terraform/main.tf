
# 1. Create Kinesis Data Stream
resource "aws_kinesis_stream" "xfusion_stream" {
  name             = "xfusion-kinesis-stream"
  shard_count      = 1
  retention_period = 24

  # 2. Enable shard-level monitoring for observability
  shard_level_metrics = [
    "IncomingBytes",
    "IncomingRecords",
    "OutgoingBytes",
    "OutgoingRecords",
    "WriteProvisionedThroughputExceeded",
    "ReadProvisionedThroughputExceeded",
    "IteratorAgeMilliseconds",
  ]

  tags = {
    Environment = "Production"
    Team        = "Nautilus-DevOps"
  }
}

# 3. Create CloudWatch Alarm for Throughput Issues
resource "aws_cloudwatch_metric_alarm" "kinesis_alarm" {
  alarm_name          = "xfusion-kinesis-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = "AWS/Kinesis"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This alarm monitors Kinesis write throughput limits."
  
  dimensions = {
    StreamName = aws_kinesis_stream.xfusion_stream.name
  }

  # Ensure immediate detection
  treat_missing_data = "notBreaching"
}