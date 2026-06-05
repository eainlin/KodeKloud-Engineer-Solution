output "kke_instance_names" {
  value = aws_instance.datacenter[*].tags.Name
}   