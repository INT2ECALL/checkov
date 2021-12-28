module "bucket1" {
  source = "./bucket1"
}

resource "aws_s3_bucket" "example0" {
  bucket = "bucket0"
  tags = {
    yor_trace = "03792a5c-d5d5-4721-b0a0-595ab435c200"
  }
}