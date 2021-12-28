resource "aws_docdb_cluster" "fail" {
  cluster_identifier  = "mycluster"
  availability_zones  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  master_username     = "foo"
  master_password     = "mustbeeightcharaters"
  storage_encrypted   = true
  skip_final_snapshot = true
  tags = {
    yor_trace = "cc50d501-7a01-4965-b801-e47c78e6e615"
  }
}

resource "aws_docdb_cluster" "pass" {
  cluster_identifier  = "mycluster"
  availability_zones  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  master_username     = "foo"
  master_password     = "mustbeeightcharaters"
  storage_encrypted   = true
  kms_key_id          = aws_kms_key.foo.arn
  skip_final_snapshot = true
  tags = {
    yor_trace = "dc313251-ceb6-4b3a-ac0f-b5788be5f0db"
  }
}