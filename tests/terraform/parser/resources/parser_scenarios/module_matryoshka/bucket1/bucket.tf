module "bucket2" {
  source = "./bucket2"
}

resource "aws_s3_bucket" "example1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "135e8801-992c-4048-b2c6-3aca5a8b8312"
  }
}