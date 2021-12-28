resource "aws_s3_bucket" "my_bucket" {
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "7e45ee49-5ecd-4f2b-8d22-f3b458b7cb59"
  }
}