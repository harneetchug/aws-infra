resource "aws_lambda_function" "file_processor" {
  function_name = "file-processor"
  runtime       = "java17"
  handler       = "com.example.Handler::handleRequest"

  role = aws_iam_role.lambda_role.arn

  filename         = "lambdaapp.jar"
  source_code_hash = filebase64sha256("lambdaapp.jar")

  timeout = 10
}