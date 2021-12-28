resource "aws_s3_bucket" "bucket_good_1" {
  bucket = "bucket_good"
  tags = {
    yor_trace = "1182939b-51e8-49a8-9fa5-85b4b0974fb7"
  }
}

resource "aws_s3_bucket" "bucket_bad_1" {
  bucket = "bucket_bad_1"
  tags = {
    yor_trace = "ab3a999f-4a6e-4da5-9412-cded78923277"
  }
}

resource "aws_s3_bucket" "bucket_bad_2" {
  bucket = "bucket_bad_2"
  tags = {
    yor_trace = "d26515b9-4789-49f1-9760-f2bb4dac80bc"
  }
}

resource "aws_s3_bucket" "bucket_bad_3" {
  bucket = "bucket_bad_3"
  tags = {
    yor_trace = "8d41f9c6-8e0a-4dff-9cd4-45a3b5d8dab3"
  }
}

resource "aws_s3_bucket" "bucket_bad_4" {
  bucket = "bucket_bad_4"
  tags = {
    yor_trace = "c7edd73c-bd4e-4a58-b958-015ba4cc487f"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.bucket_good_1.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_public_access_block" "access_bad_1" {
  bucket = aws_s3_bucket.bucket_bad_1.id
}

resource "aws_s3_bucket_public_access_block" "access_bad_2" {
  bucket = aws_s3_bucket.bucket_bad_2.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_public_access_block" "access_bad_3" {
  bucket = aws_s3_bucket.bucket_bad_3.id

  block_public_acls   = false
  block_public_policy = true
}