resource "aws_dynamodb_table" "cross-environment-violations" {
  # checkov:skip=CKV_AWS_28: ignoring backups for now
  name           = "CrossEnvironmentViolations"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }
  provider = aws.current_region
  tags = {
    yor_trace = "55facc9e-49cd-42b5-9567-d6bbc14f89ef"
  }
}