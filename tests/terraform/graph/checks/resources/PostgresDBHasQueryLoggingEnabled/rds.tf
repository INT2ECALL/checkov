//will be correct params
resource "aws_rds_cluster" "pass" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pass.name
  tags = {
    yor_trace = "dce12632-464b-43e6-9e0e-a86c6c9de7f9"
  }
}

resource "aws_rds_cluster_parameter_group" "pass" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "250ms"
  }
  tags = {
    yor_trace = "d9da2314-1033-4648-97b4-9d8b8e570eea"
  }
}

resource "aws_rds_cluster" "fail" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fail.name
  tags = {
    yor_trace = "583da1ce-f329-4ee7-8f6d-6ec8664e799e"
  }
}

//not correct params
resource "aws_rds_cluster_parameter_group" "fail" {
  name        = "mysql-cluster-fail"
  family      = "mysql"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
  tags = {
    yor_trace = "8723fa50-e486-4603-9636-479506f06764"
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_rds_cluster" "fail2" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fail2.name
  tags = {
    yor_trace = "259e0c2f-4799-4acf-a22c-e7e838740912"
  }
}

resource "aws_rds_cluster_parameter_group" "fail2" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "log_statement"
    value = "all"
  }
  tags = {
    yor_trace = "eba8310a-0f5c-414b-9254-4a4b2a3e260c"
  }
}



