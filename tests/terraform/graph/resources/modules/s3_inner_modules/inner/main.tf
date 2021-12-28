resource "aws_s3_bucket" "inner_s3" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = ""
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "05bbea62-b4bd-47e4-8db4-953e8362e8e5"
  }
}