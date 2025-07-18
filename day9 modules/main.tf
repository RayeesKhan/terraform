provider "aws" {
  
}
module "dev" {
  
  source = "../ModulTemplate"
  ami_id = "ami-05ffe3c48a9991133"
type = "t2.micro"
tags = {
  Name ="Linux Test Box4"
  CostCenter ="1020"
}
}