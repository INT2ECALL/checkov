variable "name" {}

locals {
  MODULE_TAIL = "bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.name}-${local.MODULE_TAIL}"
  tags = {
    yor_trace = "4d1dd6ac-a3a4-4523-bd2d-c62018f8c3d3"
  }
}