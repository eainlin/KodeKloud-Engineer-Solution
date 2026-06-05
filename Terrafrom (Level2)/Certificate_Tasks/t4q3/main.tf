resource "aws_sns_topic" "sns_topic" {
  name = "xfusion-sns-topic-t4q3"
}

resource "aws_sqs_queue" "sqs_queue" {
  name = "xfusion-sqs-queue-t4q3"
}

resource "aws_sqs_queue_policy" "queue_policy" {
  queue_url = aws_sqs_queue.sqs_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "Allow-SNS-SendMessage"
        Effect    = "Allow"
        Principal = "*"
        Action    = "sqs:SendMessage"
        Resource  = aws_sqs_queue.sqs_queue.arn

        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.sns_topic.arn
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_queue.arn
}