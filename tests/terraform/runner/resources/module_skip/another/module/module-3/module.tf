# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "nested-inside" {
  bucket = "nested-inside-bucket"
  tags = {
    yor_trace = "5b1d0927-f34c-4d14-b6a2-b9d90bf41d2e"
  }
}
