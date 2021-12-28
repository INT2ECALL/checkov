resource "aws_s3_bucket" "b1" {
  bucket = "abc"
  tags = {
    yor_trace = "4acec130-6cca-4b47-aec6-2d1078bd27e0"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "xyz"
  tags = {
    yor_trace = "a3f06008-9edc-403a-8262-79f00280a37a"
  }
}

resource "aws_s3_bucket" "b3" {
  bucket = "ccc"
  tags = {
    yor_trace = "9a5add7b-312c-44a7-b1f7-1e4b26ed734e"
  }
}