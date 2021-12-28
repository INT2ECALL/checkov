resource "aws_kinesis_stream" "pass" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.sse_aws_kms_key_id.id
  tags = {
    yor_trace = "864b69a8-3c03-4bd0-a917-f142001dfa80"
  }
}

resource "aws_kinesis_stream" "fail" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  tags = {
    yor_trace = "4da48092-e708-40a5-a65d-2d555a7e2a45"
  }
}