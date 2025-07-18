variable "ami_id" {
    description = "this ami will created linux t2micro instance"
    type = string
    default = ""
  
}
variable "type" {
  
  type = string
  default = ""
}
variable "tags" {
  
  type = map(string)
  default = {

  }
}

