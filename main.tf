/*resource "aws_s3_bucket" "upload_bucket" {
  bucket = "harneet-upload-bucket"
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "harneet-artifact-bucket"
}*/

resource "aws_s3_bucket_notification" "trigger" {
  bucket = "harneet-upload-bucket"

  lambda_function {
    lambda_function_arn = aws_lambda_function.file_processor.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

/*resource "aws_iam_role" "lambda_role" {
  name = "s3_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
data "aws_iam_role_policy_attachment" "basic_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
data "aws_iam_role_policy_attachment" "basic_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

 */
data "aws_iam_role" "lambda_role" {
  name = "s3_lambda_role"
}


