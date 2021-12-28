# pass

resource "aws_dynamodb_table" "cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  }
  tags = {
    yor_trace = "95281576-e4d3-4c39-87ac-a4adca005486"
  }
}

# failure

resource "aws_dynamodb_table" "default" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
  tags = {
    yor_trace = "1088f316-3ad0-4b98-bfc8-e7198d1c9bd5"
  }
}

resource "aws_dynamodb_table" "encrypted_false" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "17c96337-3456-42c7-9e99-2286e1631c7d"
  }
}

resource "aws_dynamodb_table" "encrypted_no_cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "449246b8-0e13-49e7-ae46-264da73d7d3f"
  }
}
