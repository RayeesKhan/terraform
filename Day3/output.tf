output "ipadded" {
  value = aws_instance.EC2L.public_ip
}
output "Winipadded" {
  value = aws_instance.EC2WIN.public_ip
}