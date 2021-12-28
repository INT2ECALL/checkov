resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "ebe7cd60-e967-4c3e-8e61-8ecad772ae8e"
  }
}