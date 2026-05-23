variable "lambda_artifact" {
  type        = string
  description = "S3 key for Lambda artifact"
}
resource "aws_lambda_function" "file_processor" {
  function_name = "file-processor"
  runtime       = "java17"
  handler       = "com.example.Handler::handleRequest"

  role = data.aws_iam_role.lambda_role.arn

  s3_bucket = "harneet-artifact-bucket"
  s3_key    = var.lambda_artifact


  timeout = 10
}
