resource "aws_lambda_function" "this" {
  count = 0

  function_name = "lambda_function_name"
  role          = ""
  handler       = ""
  runtime       = ""
  tags = {
    yor_trace = "5fb920a2-3afd-4b7a-bd76-18b9d0f40110"
  }
}
