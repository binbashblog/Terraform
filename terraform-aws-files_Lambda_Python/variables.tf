# ----------------------------------------------------------------------------------------
# VARIABLES
# ----------------------------------------------------------------------------------------
variable "aws_region" {
  default = "eu-west-1"
}

variable "access_key" {}
variable "secret_key" {}

variable "env_name" {
  description = "The environment that the lambda is being deployed into"
  type        = "string"
  default     = "test"
}

variable "lambda_runtime" {
  description = "The python runtime environment used to execute the lambda function"
  type        = "string"
  default     = "python3.8"
}

variable "lambda_timeout" {
  description = "The execution timeout in seconds"
  type        = "string"
  default     = "30" 
}

variable "lambda_memory" {
  description = "The amount of memory assigned to lambda"
  type        = "string"
  default     = "128"
}

