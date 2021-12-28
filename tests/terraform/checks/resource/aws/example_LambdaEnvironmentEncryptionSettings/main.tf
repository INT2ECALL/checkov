resource "aws_lambda_function" "fail" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  tags = {
    yor_trace = "97fdba6d-88d6-4cb6-80e3-26d5b9a706a7"
  }
}

resource "aws_lambda_function" "failkmsnovars" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "ea43f710-6016-4ecd-a437-ed376d2bd974"
  }
}

resource "aws_lambda_function" "ignore" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  tags = {
    yor_trace = "a94b3523-e7e5-458c-97e7-96bcabf46736"
  }
}

resource "aws_lambda_function" "pass" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "acdd7e1f-e07e-4512-861c-ec4da1e4c883"
  }
}

resource "aws_lambda_function" "failasempty" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  kms_key_arn = ""
  tags = {
    yor_trace = "68fc6a55-cd72-4e4a-9d4e-f53a51d1386c"
  }
}
