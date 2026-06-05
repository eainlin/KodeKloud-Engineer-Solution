resource "aws_iam_user" "user" {
  name = var.KKE_USER_NAME

  provisioner "local-exec" {
    command = "echo 'KKE ${var.KKE_USER_NAME} has been created successfully!' > /home/bob/terraform/t3q2/KKE_user_created.log"
  }
}