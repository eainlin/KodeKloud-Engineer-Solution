resource "null_resource" "s3_cleanup" {
  provisioner "local-exec" {
    command = <<EOT
      aws s3 cp s3://nautilus-bck-3485 /opt/s3-backup/ --recursive --region us-east-1
      aws s3 rm s3://nautilus-bck-3485 --recursive --region us-east-1
      aws s3api delete-bucket --bucket nautilus-bck-3485 --region us-east-1
    EOT
  }
}