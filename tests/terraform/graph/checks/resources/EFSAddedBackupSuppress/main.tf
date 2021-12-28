resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
  tags = {
    yor_trace = "1c5aa76d-d327-43b3-904f-0591875e4b8a"
  }
}

resource "aws_backup_selection" "ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn,
    aws_efs_file_system.ok_efs.arn,
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "f4b87a14-ebb6-4fc7-b2c3-d33fe7982e7c"
  }
}

resource "aws_backup_selection" "not_ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "f4b87a14-ebb6-4fc7-b2c3-d33fe7982e7c"
  }
}

resource "aws_efs_file_system" "not_ok_efs" {
  # checkov:skip=CKV2_AWS_18:Skip test
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "bd279f78-42a2-454e-8f48-a48ef918bd20"
  }
}