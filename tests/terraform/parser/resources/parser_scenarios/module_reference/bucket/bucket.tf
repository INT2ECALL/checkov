output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "my_bucket"
  tags = {
    yor_trace = "c80be58d-12c0-42c8-87c9-659f7972ad76"
  }
}