resource "aws_s3_object_copy" "pass" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  kms_key_id         = aws_kms_key.test.arn
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
  tags = {
    yor_trace = "689c964e-c5ac-4615-a7c8-5a9aed7d3ac7"
  }
}

resource "aws_s3_object_copy" "fail" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
  tags = {
    yor_trace = "b82db79f-ca38-4060-95e3-8d7b8d0a409b"
  }
}