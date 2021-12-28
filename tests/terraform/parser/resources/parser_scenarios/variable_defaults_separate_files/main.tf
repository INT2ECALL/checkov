resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "17cac945-513c-47a3-9fd3-3409f08d8488"
  }
}
