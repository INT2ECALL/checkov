resource "aws_fsx_lustre_file_system" "pass" {
  storage_capacity            = 1200
  subnet_ids                  = [aws_subnet.test1.id]
  deployment_type             = "PERSISTENT_1"
  per_unit_storage_throughput = 50
  kms_key_id                  = aws_kms_key.test1.arn
  tags = {
    yor_trace = "a34e6326-df96-45fa-9dca-8a8ba135aced"
  }
}

resource "aws_fsx_lustre_file_system" "fail" {
  storage_capacity            = 1200
  subnet_ids                  = [aws_subnet.test1.id]
  deployment_type             = "PERSISTENT_1"
  per_unit_storage_throughput = 50
  tags = {
    yor_trace = "855e58d7-755e-4fc3-82dd-bd0606fa5a78"
  }
}