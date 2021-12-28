resource "aws_efs_file_system" "pass" {
  encrypted  = true
  kms_key_id = aws_kms_key.test.arn
  tags = {
    yor_trace = "84e697bc-6d39-44f4-bdec-e8c84d26b831"
  }
}

resource "aws_efs_file_system" "fail" {
  encrypted = true
  tags = {
    yor_trace = "10694d44-94a7-4b16-93a7-68be9eb40575"
  }
}