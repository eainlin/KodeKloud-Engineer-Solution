# 1. Create the SNS Topic
resource "aws_sns_topic" "datacenter_sns_topic" {
  name = "datacenter-sns-topic"
}

# 2. Create the SQS Queue
resource "aws_sqs_queue" "datacenter_sqs_topic" {
  name = "datacenter-sqs-queue"
}

# 3. Create the SNS to SQS Subscription
resource "aws_sns_topic_subscription" "datacenter_subscription" {
  topic_arn = aws_sns_topic.datacenter_sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.datacenter_sqs_topic.arn
}

# 4. Allow SNS to publish messages into the SQS Queue
resource "aws_sqs_queue_policy" "datacenter_sqs_policy" {
  queue_url = aws_sqs_queue.datacenter_sqs_topic.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSNSPublish"
        Effect    = "Allow"
        Principal = {
          Service = "sns.amazonaws.com"
        }
        Action    = "sqs:SendMessage"
        Resource  = aws_sqs_queue.datacenter_sqs_topic.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.datacenter_sns_topic.arn
          }
        }
      }
    ]
  })
}