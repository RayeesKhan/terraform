resource "aws_instance" "EC2L" {
    ami = var.ami_id
    instance_type= var.type
    tags = var.tags
 
  
}
resource "aws_instance" "EC2WIN" {
    ami = var.ami_id
    instance_type= var.type
    tags = var.tags
  
}