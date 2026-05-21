resource "aws_lambda_function" "file_processor" {
  function_name = "file-processor"
  runtime       = "java17"
  handler       = "com.example.Handler::handleRequest"

  role = aws_iam_role.lambda_role.arn

  s3_bucket = "harneet-artifact-bucket"
  s3_key    = "lambdaapp/lambdaapp.jar"


  timeout = 10
}