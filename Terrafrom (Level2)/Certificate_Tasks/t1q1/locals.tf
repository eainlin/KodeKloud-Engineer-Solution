locals {
  cf_template_body = <<EOF
{
  "AWSTemplateFormatVersion": "2010-09-09",
  "Parameters": {
    "TableName": {
      "Type": "String"
    }
  },
  "Resources": {
    "DynamoDBTable": {
      "Type": "AWS::DynamoDB::Table",
      "Properties": {
        "TableName": {
          "Ref": "TableName"
        },
        "BillingMode": "PAY_PER_REQUEST",
        "AttributeDefinitions": [
          {
            "AttributeName": "id",
            "AttributeType": "S"
          }
        ],
        "KeySchema": [
          {
            "AttributeName": "id",
            "KeyType": "HASH"
          }
        ]
      }
    }
  }
}
EOF
}