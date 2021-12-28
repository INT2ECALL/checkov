# pass
resource "aws_s3_bucket" "passed_bucket" {
  bucket = "passed_bucket"
  acl    = var.private_acl
  tags = {
    yor_trace = "bfe42e74-9149-49e0-beb5-ee3cb83b10d1"
  }
}

# fail
resource "aws_s3_bucket" "failed_bucket" {
  bucket = "failed_bucket"
  acl    = var.public_read_write_acl
  tags = {
    yor_trace = "7c32284a-426a-43e7-9e1c-7e07c3c9608b"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = var.var_doesnt_exist
  tags = {
    yor_trace = "c3260889-7fdd-4698-be24-75caba0fdb54"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_2" {
  bucket = "unknown_acl_bucket_2"
  acl    = var.unscoped_private_acl
  tags = {
    yor_trace = "b9c3b2be-fbc2-4ad9-b8c4-c2f154c56fac"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_3" {
  bucket = "unknown_acl_bucket_3"
  acl    = var.unscoped_public_read_write_acl
  tags = {
    yor_trace = "7edfe71d-e7e9-48a8-aee1-2df154d33712"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_4" {
  bucket = "unknown_acl_bucket_4"
  acl    = local.unscoped_private_acl
  tags = {
    yor_trace = "97cf872d-5378-410f-9155-bd1adf1e7950"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_5" {
  bucket = "unknown_acl_bucket_5"
  acl    = local.unscoped_public_read_write_acl
  tags = {
    yor_trace = "c3338b8e-cb82-4a56-847e-2138ee7bffaa"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = data.doesnt_exist
  tags = {
    yor_trace = "9c526d0a-371c-4185-8eb8-81489df8aee5"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = module.doesnt_exist
  tags = {
    yor_trace = "9c526d0a-371c-4185-8eb8-81489df8aee5"
  }
}