# ----------------------------------------------------------------------------------------
# DEPLOY HELLO LAMBDA
# ----------------------------------------------------------------------------------------
resource "aws_lambda_function" "hello_lambda" {
      function_name = "hello_lambda"
      description   = "Test Python Lambda Function"
      filename      = "${path.module}/lambda/lambda.zip"
      handler       = "hello_lambda.lambda_handler"
      runtime       = "${var.lambda_runtime}"
      timeout       = "${var.lambda_timeout}"
      memory_size   = "${var.lambda_memory}"
      role          = "${aws_iam_role.hello_lambda_role.arn}"

      environment {
        variables = {
          "env_name" = "${var.env_name}"
        }
      }
}