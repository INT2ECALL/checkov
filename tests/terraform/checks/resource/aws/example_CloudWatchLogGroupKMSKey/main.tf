resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 1
  kms_key_id        = "someKey"
  tags = {
    yor_trace = "a5ccc667-1a7c-4b69-89f2-8991d4d1deac"
  }
}

resource "aws_cloudwatch_log_group" "fail" {
  retention_in_days = 1
  tags = {
    yor_trace = "050be879-8850-4347-a756-f2fd2fd51380"
  }
}
