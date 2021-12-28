
resource "aws_s3_bucket_object" "pass" {
  bucket       = aws_s3_bucket.object_bucket.bucket
  key          = "tf-testing-obj-%[1]d-encrypted"
  content      = "Keep Calm and Carry On"
  content_type = "text/plain"
  kms_key_id   = aws_kms_key.example.arn
  tags = {
    yor_trace = "fceb711d-b781-4a22-bd5d-245277e0041c"
  }
}


resource "aws_s3_bucket_object" "fail" {
  bucket       = aws_s3_bucket.object_bucket.bucket
  key          = "tf-testing-obj-%[1]d-encrypted"
  content      = "Keep Calm and Carry On"
  content_type = "text/plain"
  tags = {
    yor_trace = "b1ca91a9-4ef0-4761-9560-f60e2d64ee20"
  }
}