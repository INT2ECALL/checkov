resource "aws_ebs_volume" "ebs_good" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "8b528d18-9f4f-4a22-8f22-b91ae3932680"
  }
}

resource "aws_ebs_volume" "ebs_bad" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "95224ba9-4ac2-4c22-b947-1b9446c360ea"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
    aws_ebs_volume.ebs_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
  ]
}
