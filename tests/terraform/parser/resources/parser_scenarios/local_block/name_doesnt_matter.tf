locals {
  BUCKET_NAME = "my-bucket-name"
}

resource "aws_s3_bucket" "test_with_locals" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "92fe4425-9eed-4626-a9d0-8403eec96120"
  }
}
