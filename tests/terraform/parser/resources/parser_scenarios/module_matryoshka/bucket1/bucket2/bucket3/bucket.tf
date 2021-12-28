resource "aws_s3_bucket" "example3" {
  bucket = "bucket3"
  acl    = "public-read" # used by test_runner.py
  tags = {
    yor_trace = "7adec63a-e303-4110-8477-297a58533c77"
  }
}