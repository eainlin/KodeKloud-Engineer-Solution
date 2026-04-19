resource "aws_dynamodb_table" "datacenter_users" {
  name         = "datacenter-users-t3q1"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "datacenter_id_t3q1"

  attribute {
    name = "datacenter_id_t3q1"
    type = "S"
  }

  tags = {
    Name = "datacenter-users-t3q1"
  }
}