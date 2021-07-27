variable "access_key" {}
variable "secret_key" {}

variable "aws_region" {
  default = "eu-west-1"
}
variable "AMIS" {
 type = map(string)
 default = {
  eu-west-1 = "ami-0d4a18a6050cef430"
  eu-west-2 = "ami-03397edfc64482efd"
  eu-west-3 = "ami-0b20c308206de0227"
 }
} 

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
