# pass

resource "aws_db_instance" "enabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "28d3688c-5ae3-457c-a4b3-d3e169119a42"
  }
}

resource "aws_db_instance" "enabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "c8e4abb7-6e54-4d69-936b-2623e64e189d"
  }
}

# failure

resource "aws_db_instance" "default_mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "4795c557-bd90-465b-a3c3-eefaed47ebfd"
  }
}

resource "aws_db_instance" "default_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "3b91f475-cfd9-4a3d-9b36-45d2ef5f3be1"
  }
}

resource "aws_db_instance" "disabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "be52e8a8-1528-4fe6-b20f-60039dc837bc"
  }
}

resource "aws_db_instance" "disabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "77d2bfa4-6afa-44b3-a850-e99c59104662"
  }
}

# unknown

resource "aws_db_instance" "mariadb" {
  allocated_storage = 5
  engine            = "mariadb"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "c4f2e43a-3dbc-4e1c-8cad-d56586445a05"
  }
}
