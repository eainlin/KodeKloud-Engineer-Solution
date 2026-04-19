resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "xfusion-vol"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Xfusion Snapshot"
  depends_on  = [aws_ebs_volume.k8s_volume]

  tags = {
    Name = "xfusion-vol-ss"
  }
}