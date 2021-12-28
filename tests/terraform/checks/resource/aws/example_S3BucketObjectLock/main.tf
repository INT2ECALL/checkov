# pass

resource "aws_s3_bucket" "enabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "604f3da0-c8cb-4768-bd98-d30670f377ef"
  }
}

resource "aws_s3_bucket" "enabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "021d7ff9-3a3f-4e46-9073-da050d951469"
  }
}

# failure

resource "aws_s3_bucket" "disabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "f424909e-3bd9-4a57-a457-d229153bd570"
  }
}

resource "aws_s3_bucket" "disabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "e8060ea4-c911-4abb-bbd5-e3166abce07d"
  }
}

# unknown

resource "aws_s3_bucket" "default" {
  bucket = "test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "91d96d61-3fb6-42e1-a326-99f1fb78edfc"
  }
}
