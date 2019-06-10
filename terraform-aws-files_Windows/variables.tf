variable "access_key" {}
variable "secret_key" {}

variable "aws_region" {
  default = "eu-west-1"
}
variable "WIN_AMIS" {
 type = "map"
 default = {
  eu-west-1 = "ami-03838ccd5cfb84782"
  eu-west-2 = "ami-0ebf422d2a92724ec"
  eu-west-3 = "ami-022cfeccb4b72d6b8"
 }
} 

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "Terraform"
}
variable "INSTANCE_PASSWORD" { }
