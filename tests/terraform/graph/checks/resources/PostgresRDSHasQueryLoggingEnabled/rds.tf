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
    yor_trace = "261e21f2-ef49-411a-970f-fece34565325"
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
    yor_trace = "c14d9777-dedb-4d3f-ad7d-2a0560488d09"
  }
}

# 10+ parameters

resource "aws_rds_cluster" "pass_many_parameters" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-postgresql"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pass_many_parameters.name
  tags = {
    yor_trace = "1dc2479f-339c-4066-b3ed-ee4ed6eca517"
  }
}

resource "aws_rds_cluster_parameter_group" "pass_many_parameters" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "fake_1"
    value = "fake_1"
  }

  parameter {
    name  = "fake_2"
    value = "fake_2"
  }

  parameter {
    name  = "fake_3"
    value = "fake_3"
  }

  parameter {
    name  = "fake_4"
    value = "fake_4"
  }

  parameter {
    name  = "fake_5"
    value = "fake_5"
  }

  parameter {
    name  = "fake_6"
    value = "fake_6"
  }

  parameter {
    name  = "fake_7"
    value = "fake_7"
  }

  parameter {
    name  = "fake_8"
    value = "fake_8"
  }

  parameter {
    name  = "fake_9"
    value = "fake_9"
  }

  parameter {
    name  = "fake_10"
    value = "fake_10"
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "250ms"
  }
  tags = {
    yor_trace = "b1317663-bb80-4a50-9614-5fc4096e6934"
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
    yor_trace = "174850bc-cd6b-4a34-a7af-ecf9df7ddcde"
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
    yor_trace = "2d6fad2c-9567-4612-9f71-702b065d9a96"
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
    yor_trace = "023ae017-1b80-4000-a568-ed8b23baf77f"
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
    yor_trace = "9372fc2b-2ed3-4d95-a549-9cda5a34d889"
  }
}



