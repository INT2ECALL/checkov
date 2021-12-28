# fail
resource "aws_db_instance" "disabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = false
  tags = {
    yor_trace = "aa9b7ea7-0375-4ef7-8e03-28bf4e4fedc0"
  }
}

# fail
resource "aws_db_instance" "default" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  tags = {
    yor_trace = "7667f68d-4b51-4b15-9524-dd67734c163e"
  }
}

# pass
resource "aws_db_instance" "enabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = true
  tags = {
    yor_trace = "fae78859-4441-4f39-aa78-01b8d70f6925"
  }
}