resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "RKVPC"
  }
}
resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subent 1a"
  }

}
resource "aws_subnet" "subnet1-b" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Subnet 1-b"
  }
  availability_zone = "us-east-1b"

}
resource "aws_subnet" "subnet1-c" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Subnet 1-c"
  }
  availability_zone = "us-east-1c"

}
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "MY IG"
  }

}
resource "aws_route_table" "name" {
  tags = {
    Name = "My route"
  }
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }

}
resource "aws_route_table_association" "name" {
  subnet_id      = aws_subnet.name.id
  route_table_id = aws_route_table.name.id

}
resource "aws_security_group" "name" {

  tags = {
    Name = "My SG 1"
  }
  vpc_id = aws_vpc.name.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_instance" "name" {
  ami                    = "ami-0150ccaf51ab55a51"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.name.id
  vpc_security_group_ids = [aws_security_group.name.id]
  tags = {
    Name = "test server 1"
  }
}
resource "aws_eip" "name" {

  tags = {
    Name = "elastic IP"
  }

}
resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.name.id
  subnet_id     = aws_subnet.subnet1-b.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.name]
}
