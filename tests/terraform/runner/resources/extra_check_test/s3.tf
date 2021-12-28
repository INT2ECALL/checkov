resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Production"
    yor_trace   = "48e42929-23aa-4f90-8aba-f7b1f78b3f7d"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "e50f1a7d-4336-4cff-87b9-b6032b730ada"
  }
}


resource "aws_s3_bucket" "c" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "b514e915-072b-4115-a6a0-d6eba94ac8b1"
  }
}


