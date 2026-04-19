resource "aws_dynamodb_table" "datacenter-users" {
  name             = "datacenter-users"
  hash_key         = "datacenter_id"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "datacenter_id"
    type = "S"
  }
}