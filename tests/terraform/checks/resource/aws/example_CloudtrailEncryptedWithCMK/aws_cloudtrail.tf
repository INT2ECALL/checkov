resource "aws_cloudtrail" "fail" {
  name                          = "TRAIL"
  s3_bucket_name                = aws_s3_bucket.test.id
  include_global_service_events = true
  tags = {
    yor_trace = "96469f62-4dc6-447e-a3e6-4ba98e262c92"
  }
}

resource "aws_cloudtrail" "pass" {
  name                          = "TRAIL"
  s3_bucket_name                = aws_s3_bucket.test.id
  include_global_service_events = true
  kms_key_id                    = aws_kms_key.test.arn
  tags = {
    yor_trace = "6e055535-27a9-492a-a8ab-f2fe4a9af5e9"
  }
}