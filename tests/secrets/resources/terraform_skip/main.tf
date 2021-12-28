resource "aws_lambda_function" "skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE" #checkov:skip=CKV_SECRET_2:example
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "c94c3981-5df3-4f30-8605-c8ff0d76aea1"
  }
}

resource "aws_lambda_function" "wrong_skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOS3F6KN7EXAMPLE" #checkov:skip=CKV_SECRET_5:wrong check id
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "59f37084-4b44-43d2-82ed-0089185a3dee"
  }
}
