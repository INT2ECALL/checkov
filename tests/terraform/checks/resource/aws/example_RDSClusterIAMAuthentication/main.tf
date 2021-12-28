# pass

resource "aws_rds_cluster" "enabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "0589533e-5c32-48d4-9194-730efa1d9c99"
  }
}

# failure

resource "aws_rds_cluster" "default" {
  master_username = "username"
  master_password = "password"
  tags = {
    yor_trace = "151fcd0f-a60d-4161-98ee-a6b070f5c7f3"
  }
}

resource "aws_rds_cluster" "disabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "7966f673-96d2-4e87-b857-fc4f6346835a"
  }
}
