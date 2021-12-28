resource "aws_sagemaker_domain" "pass" {
  domain_name = "examplea"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.test.id
  subnet_ids  = [aws_subnet.test.id]
  kms_key_id  = aws_kms_key.test.arn

  default_user_settings {
    execution_role = aws_iam_role.test.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
  tags = {
    yor_trace = "7f998ac3-688b-4205-b00f-da02852ce568"
  }
}

resource "aws_sagemaker_domain" "fail" {
  domain_name = "examplea"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.test.id
  subnet_ids  = [aws_subnet.test.id]

  default_user_settings {
    execution_role = aws_iam_role.test.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
  tags = {
    yor_trace = "fbf5eaea-3927-45e0-944f-9d58d9c28f0e"
  }
}