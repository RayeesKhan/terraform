terraform {
  backend "s3" {
    bucket = "rk10072025"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = false
    dynamodb_table = "rayeestb"
    encrypt = true
  }
}
