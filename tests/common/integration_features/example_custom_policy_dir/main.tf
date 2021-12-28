
resource "aws_s3_bucket" "b1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "3791ff1d-8b16-4488-9b40-f023b7e49920"
  }
}
