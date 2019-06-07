variable "instance_type" {
 description = "EC2 instance type to use"
 default = "t2.micro"
}

variable "instance_types" {
 type = "map"
 default = {
   "uat"  = "t2.small"
   "prod" = "t3.large"
 }
}

variable "autoscale_min" {
 description = "Minimum number of EC2 instances"
 default = 1
}

variable "autoscale_max" {
 description = "Maximum number of EC2 instances"
 default = 3
}

variable "autoscale_desired" {
 description = "Desired number of EC2 instances"
 default = 2
}

variable "alb_name" {
 description = "Application load balancer name"
 default = "bbb_alb"
}

variable "region" {
  default = "us-east-1"
}
