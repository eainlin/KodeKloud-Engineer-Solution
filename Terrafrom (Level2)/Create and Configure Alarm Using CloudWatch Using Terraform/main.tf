# ---------------------------
# SNS Topic (Managed Resource)
# ---------------------------
resource "aws_sns_topic" "sns_topic" {
  name = "xfusion-sns-topic"
}

# ---------------------------
# Launch EC2 Instance
# ---------------------------
resource "aws_instance" "xfusion_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "xfusion-ec2"
  }
}

# ---------------------------
# CloudWatch Alarm
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "xfusion_alarm" {
  alarm_name          = "xfusion-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 90

  dimensions = {
    InstanceId = aws_instance.xfusion_ec2.id
  }

  alarm_actions = [aws_sns_topic.sns_topic.arn]
}