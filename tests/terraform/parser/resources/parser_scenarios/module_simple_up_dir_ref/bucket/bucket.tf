resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "32af0138-fc39-4c22-a701-401c13e51868"
  }
}