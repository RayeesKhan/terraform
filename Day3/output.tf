output "ipadded" {
  value = aws_instance.EC2L.public_ip
}
output "Winipadded" {
  value = aws_instance.EC2WIN.vpc_security_group_ids
}