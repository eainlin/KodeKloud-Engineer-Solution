resource "aws_iam_user" "iam_user" {
  name = var.KKE_USER_NAME
  
  # Execute local command after resource creation
  provisioner "local-exec" {
    command = "echo 'KKE ${var.KKE_USER_NAME} has been created successfully!' > /home/bob/terraform/KKE_user_created.log"
  }
}

