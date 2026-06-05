# ---------------------------
# CloudFormation Stack
# ---------------------------
# CloudFormation Stack
# ---------------------------
resource "aws_cloudformation_stack" "datacenter_stack" {
  name          = "datacenter-dynamodb-stack"
  template_body = local.cf_template_body

  # Lifecycle rule to ignore manual changes to parameters
  lifecycle {
    ignore_changes = [
      parameters
    ]
  }
}
