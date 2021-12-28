variable "name" {}

locals {
  BUCKET_NAME = var.name
}

resource "aws_s3_bucket" "example" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "ed9ee2f3-8a0c-4e39-a02e-7dad17564d18"
  }
}