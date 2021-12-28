resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = var.acl
  versioning {
    enabled = var.is_enabled
  }
  tags = {
    yor_trace = "cba1ff75-3ad9-46da-9a1a-0d325c39a306"
  }
}