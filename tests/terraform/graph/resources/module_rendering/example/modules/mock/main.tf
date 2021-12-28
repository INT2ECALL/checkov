resource "aws_s3_bucket" "some-bucket" {
  bucket = "my-bucket"
  tags = {
    yor_trace = "29deccd8-7208-42af-9b4a-17832c8b5c3b"
  }
}

output "o1" {
  value = aws_s3_bucket.some-bucket.arn
}