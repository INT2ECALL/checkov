# pass

resource "aws_db_instance" "postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "postgres"
  username          = "postgres"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  tags = {
    yor_trace = "f5afe900-1f7c-4b49-930b-25ca81ebd2b2"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  tags = {
    yor_trace = "171f7864-6e97-4722-84ee-49ea3a9f261b"
  }
}

# failure

resource "aws_db_instance" "default" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"
  tags = {
    yor_trace = "7d4c86ae-c664-4692-96ec-4e50b9e371ab"
  }
}

resource "aws_db_instance" "empty" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = []
  tags = {
    yor_trace = "aa59722f-acaa-4744-9c0f-62b9ad35474b"
  }
}
