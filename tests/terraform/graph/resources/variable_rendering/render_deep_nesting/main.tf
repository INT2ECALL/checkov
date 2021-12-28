resource "aws_s3_bucket" "default" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }
  tags = {
    yor_trace = "8be26b15-7cb1-4fb1-989d-0dd612081d26"
  }
}