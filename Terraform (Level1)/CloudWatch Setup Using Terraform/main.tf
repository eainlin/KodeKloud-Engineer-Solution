resource "aws_cloudwatch_log_group" "nautilus-log-group" {
  name = "nautilus-log-group"
}

resource "aws_cloudwatch_log_stream" "nautilus-log-stream" {
  name           = "nautilus-log-stream"
  log_group_name = aws_cloudwatch_log_group.nautilus-log-group.name
}