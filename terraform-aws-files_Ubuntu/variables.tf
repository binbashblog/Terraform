variable "access_key" {}
variable "secret_key" {}

variable "aws_region" {
  default = "eu-west-1"
}
variable "AMIS" {
 type = "map"
 default = {
  eu-west-1 = "ami-0e312952b4cc28a7f"
  eu-west-2 = "ami-0207d97139a2faf80"
  eu-west-3 = "ami-024078eab34b743ca"
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
