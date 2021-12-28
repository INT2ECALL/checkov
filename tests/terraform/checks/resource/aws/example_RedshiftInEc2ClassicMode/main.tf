resource "aws_redshift_cluster" "fail" {
  cluster_identifier  = "redshift-defaults-only"
  node_type           = "dc2.large"
  master_password     = "Test1234"
  master_username     = "test"
  skip_final_snapshot = true
  tags = {
    yor_trace = "a85d5cc4-1ac9-4067-a062-4693458de04a"
  }
}

resource "aws_redshift_cluster" "pass" {
  cluster_identifier        = "redshift-defaults-only"
  node_type                 = "dc2.large"
  master_password           = "Test1234"
  master_username           = "test"
  skip_final_snapshot       = true
  cluster_subnet_group_name = "subnet-ebd9cead"
  tags = {
    yor_trace = "ebda2cad-0000-4dea-9052-becbe97d9111"
  }
}
