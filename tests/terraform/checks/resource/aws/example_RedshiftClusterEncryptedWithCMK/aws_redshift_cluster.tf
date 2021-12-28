resource "aws_redshift_cluster" "pass" {
  cluster_identifier                  = "examplea"
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  encrypted                           = true
  kms_key_id                          = aws_kms_key.test.arn
  tags = {
    yor_trace = "7b24ab5b-66dc-43c9-8b49-fde69ddf51b1"
  }
}

resource "aws_redshift_cluster" "fail" {
  cluster_identifier                  = "examplea"
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  encrypted                           = true
  tags = {
    yor_trace = "4c1d3ab8-4ec2-4aaf-b2fb-ea1499ff7a97"
  }
}