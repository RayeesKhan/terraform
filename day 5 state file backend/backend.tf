terraform {
  backend "s3" {
    bucket = "rk10072025"
    key    = "terraform.tfstate"
    region = "us-east-1"
    object_lock_enabled = "true"
  }
}
