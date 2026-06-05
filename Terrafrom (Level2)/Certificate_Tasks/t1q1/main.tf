resource "aws_cloudformation_stack" "dynamodb_stack" {
  name          = "xfusion-dynamodb-stack-t1q1"
  template_body = local.cf_template_body

  parameters = {
    TableName = var.KKE_DYNAMODB_TABLE_NAME
  }

  lifecycle {
    ignore_changes = [
      parameters
    ]
  }
}