module "bucket3" {
  source = "./bucket3"
}

resource "aws_s3_bucket" "example2" {
  bucket = "bucket2"
  tags = {
    yor_trace = "bd46b3aa-67d0-4888-bad8-7c739e686413"
  }
}