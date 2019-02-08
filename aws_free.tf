provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "exampletest1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_instance" "exampletest2" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}