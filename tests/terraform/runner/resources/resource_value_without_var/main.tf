# pass
resource "aws_s3_bucket" "enabled_bucket" {
  bucket = "enabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled
  }
  tags = {
    yor_trace = "23d4a241-7fb7-49f1-82a1-1f0a297ee5fb"
  }
}

# fail
resource "aws_s3_bucket" "disabled_bucket" {
  bucket = "disabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled
  }
  tags = {
    yor_trace = "80ce4d41-1143-4424-9182-655b6d97a713"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_var_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_unknown
  }
  tags = {
    yor_trace = "fe2892a0-b3cb-4c34-9c5c-7bef1a87ef7c"
  }
}

resource "aws_s3_bucket" "unknown_var_2_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled_2
  }
  tags = {
    yor_trace = "f83f1828-72ca-41c2-a3ce-9705df446cee"
  }
}

resource "aws_s3_bucket" "unknown_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_disabled
  }
  tags = {
    yor_trace = "8b7114c8-463b-4c0c-9074-7b81fa2ccbfd"
  }
}

resource "aws_s3_bucket" "unknown_enabled_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled_2
  }
  tags = {
    yor_trace = "1e31264a-4a1f-4e28-a260-9e25fdf59cb5"
  }
}

resource "aws_s3_bucket" "unknown_enabled_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_enabled
  }
  tags = {
    yor_trace = "e57bbce3-d3a0-40ac-8b02-bebdc8375cfb"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = data.doesnt_exist
  }
  tags = {
    yor_trace = "cfe846dc-ddbf-4e92-a3e8-55df43b8e790"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = module.doesnt_exist
  }
  tags = {
    yor_trace = "cfe846dc-ddbf-4e92-a3e8-55df43b8e790"
  }
}