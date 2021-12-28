resource "aws_lambda_function" "lambda" {

  function_name = "test"
  role          = ""

  dynamic "dead_letter_config" {
    for_each = var.dlc == null ? [] : [var.dlc]
    content {
      target_arn = dead_letter_config.value.target_arn
    }
  }
  tags = {
    yor_trace = "29b7dda5-cc8f-490b-8398-361a74af4b50"
  }
}