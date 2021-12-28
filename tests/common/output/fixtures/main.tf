resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = var.acl
  versioning {
    enabled = var.is_enabled
  }
  tags = {
    yor_trace = "abfdf820-bd6f-49cf-a55b-c3b8bc4e6528"
  }
}