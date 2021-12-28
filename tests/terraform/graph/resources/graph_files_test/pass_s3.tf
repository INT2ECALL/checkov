resource "aws_s3_bucket" "bucket_with_versioning" {
  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.encryption
      }
    }
  }
  tags = {
    yor_trace = "63249499-9c76-4909-8144-e4bba697ebb6"
  }
}