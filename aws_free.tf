provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "exampletest1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

resource "aws_instance" "exampletest2" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
