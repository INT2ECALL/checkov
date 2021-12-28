resource "aws_s3_bucket" "test" {
  bucket = "my-test-bucket"
  tags = {
    yor_trace = "31036877-b0af-451d-a7e0-df6546642438"
  }
}
