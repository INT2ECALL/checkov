resource "aws_db_instance" "pass" {
  # checkov:skip=CKV_AWS_129: ADD REASON
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_118: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.pass.id
  tags = {
    yor_trace = "0a528b09-a4df-487a-af99-d62c0b025eb1"
  }
}

resource "aws_db_parameter_group" "pass" {
  name_prefix = "my_name"
  family      = "postgres10"

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = 1000
  }
  tags = {
    yor_trace = "732cf7a6-c272-46ad-ad71-b9e874570b64"
  }
}

resource "aws_db_instance" "pass2" {
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.pass.name
  tags = {
    yor_trace = "f65cfb2c-fc6b-46b9-a9c8-328b755f25a8"
  }
}


//no parameter_group_name set
resource "aws_db_instance" "fail" {
  engine         = "postgres"
  instance_class = "db.t3.micro"
  name           = "mydb"
  tags = {
    yor_trace = "e42b49bf-cd2a-41c2-94ae-d7608b5d3e40"
  }
}

resource "aws_db_instance" "fail3" {
  # checkov:skip=CKV_AWS_118: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.fail.id
  tags = {
    yor_trace = "80f6c48b-fe19-4e15-8a75-9f794bd976cf"
  }
}

resource "aws_db_instance" "fail4" {
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.fail2.id
  tags = {
    yor_trace = "0c1ab6e5-153c-426f-a479-534541cc1e9c"
  }
}


//not postgres
resource "aws_db_instance" "ignore" {
  # checkov:skip=CKV_AWS_161: ADD REASON
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_129: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  engine         = "mysql"
  instance_class = "db.t3.micro"
  name           = "mydb"
  tags = {
    yor_trace = "4e36cca3-4eb2-4154-86c7-59ccdb7b0b7b"
  }
}

// no postgres
resource "aws_db_instance" "ignore2" {
  # checkov:skip=CKV_AWS_129: ADD REASON
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tags = {
    yor_trace = "7be9f2c6-59d6-45ee-9e28-f61869934da1"
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_db_instance" "ignore3" {
  identifier                   = "xxx-our-unique-id"
  allocated_storage            = 1000
  storage_type                 = "gp2"
  copy_tags_to_snapshot        = true
  engine                       = "sqlserver-se"
  engine_version               = "15.00.4043.16.v1"
  license_model                = "license-included"
  instance_class               = "db.r5.4xlarge"
  name                         = ""
  username                     = "sa"
  password                     = var.password
  port                         = 1433
  publicly_accessible          = false
  security_group_names         = []
  vpc_security_group_ids       = ["sg-xxxxx"]
  db_subnet_group_name         = "dbsubnet"
  performance_insights_enabled = true
  option_group_name            = "sql-std-2019"
  deletion_protection          = true
  max_allocated_storage        = 1500
  parameter_group_name         = "sql-server-2019-std"
  character_set_name           = "SQL_Latin1_General_CP1_CS_AS"
  # checkov:skip=CKV_AWS_157:Web db, acceptable risk until Resize
  multi_az                        = false
  backup_retention_period         = 35
  enabled_cloudwatch_logs_exports = ["agent", "error"]
  backup_window                   = "11:17-11:47"
  maintenance_window              = "sat:07:13-sat:08:43"
  final_snapshot_identifier       = "xxx-unique-name-final"
  tags = {
    yor_trace = "24326605-21b4-4156-b4a8-de4e5ad43a34"
  }
}

