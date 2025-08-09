resource "aws_iam_role" "lambda_exec_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.lambda_source
  output_path = var.lambda_filename
}

resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.lambda_filename

  # ensure fingerprint of code
  source_code_hash = data.archive_file.lambda.output_base64sha256

  vpc_config {
    subnet_ids         = [var.vpc_subnet_0, var.vpc_subnet_1]
    security_group_ids = [var.security_groups]
  }

  logging_config {
    log_format       = "JSON"
    system_log_level = "DEBUG"
  }

  environment {
    variables = {
      BUCKET = var.bucket_name
    }
  }

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "vpc_exec" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  count             = var.enable_logging ? 1 : 0
  name              = "/aws/lambda/${aws_lambda_function.lambda.function_name}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "auth_api_gateway" {
  count         = var.api_integration ? 1 : 0
  statement_id  = "AllowExecutionFromAPIGatewayAuth"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_iam_role_policy" "lambda_s3_policy" {
  count = var.s3_integration ? 1 : 0
  name  = "lambda_s3_policy"
  role  = aws_iam_role.lambda_exec_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = "${var.bucket_arn}/*"
      },
    ]
  })
}

resource "aws_iam_role_policy" "lambda_dynamodb_policy" {
  count = var.dynamodb_integration ? 1 : 0
  name  = "lambda_dynamodb_policy"
  role  = aws_iam_role.lambda_exec_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:GetItem"
        ]
        Resource = var.dynamodb_table_arn
      }
    ]
  })
}
