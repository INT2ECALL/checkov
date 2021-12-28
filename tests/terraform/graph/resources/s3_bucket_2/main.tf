resource "aws_s3_bucket" "private" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "d57111be-8168-4293-9523-09f3e1ea494f"
  }
}

resource "aws_s3_bucket" "public" {
  bucket = "my-tf-test-bucket"
  acl    = "public"

  tags = {
    Name        = "My other bucket"
    Environment = "Prod"
    yor_trace   = "043830d7-ad72-4af5-89ba-426e0907701e"
  }
}

resource "aws_s3_bucket" "non_tag" {
  bucket = "no-tags"
  acl    = "public"
  tags = {
    yor_trace = "f1b0753c-8882-444e-bcf1-09dee9eed7a0"
  }
}
