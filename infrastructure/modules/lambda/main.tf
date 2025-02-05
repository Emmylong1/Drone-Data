resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout

  s3_bucket     = var.lambda_s3_bucket
  s3_key        = var.lambda_s3_key

  environment {
    variables = {
      KINESIS_STREAM_ARN = var.kinesis_arn
    }
  }
}

resource "aws_lambda_event_source_mapping" "kinesis_trigger" {
  event_source_arn  = var.kinesis_arn
  function_name     = aws_lambda_function.lambda.arn
  starting_position = "LATEST"
}
