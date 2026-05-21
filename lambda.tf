
/*resource "aws_lambda_function" "file_processor" {
  function_name = "file-processor"
  runtime       = "java17"
  handler       = "com.example.Handler::handleRequest"

  role = data.aws_iam_role.lambda_role.arn

  s3_bucket = "harneet-artifact-bucket"
  s3_key    = "lambdaapp/lambdaapp.jar"


  timeout = 10
}*/

module "lambda" {
  source = "../../modules/lambda"

  function_name = "file-processor"
  s3_bucket     = "harneet-artifact-bucket"
  s3_key        = "lambdaapp/lambdaapp.jar"
}