locals {
  bucket_name = "test_bucket_name"
}

resource "aws_s3_bucket" "template_bucket" {
  region        = "us-west-2"
  bucket        = local.bucket_name
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "4ec23b5a-0ace-41e2-a3b9-c5a21add594c"
  }
}

