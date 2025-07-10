resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.nano"
  tags = {
    Name ="Day5"
  }
}
resource "aws_instance" "WIN" {
  ami = "ami-02b60b5095d1e5227"
  instance_type = "t3.nano"
  tags = {
    Name ="Day5"
  }
}
