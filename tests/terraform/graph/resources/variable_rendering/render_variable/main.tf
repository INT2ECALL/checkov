resource "aws_s3_bucket" "template_bucket" {
  region        = var.region
  bucket        = "test_bucket_name"
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "62e6a742-8155-4d28-a371-067113ad6163"
  }
}