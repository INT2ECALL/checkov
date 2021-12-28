resource "aws_redshift_cluster" "redshift_good" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  tags = {
    yor_trace = "fe434b4a-dea2-4a57-882d-67a71fa36794"
  }
}

resource "aws_redshift_cluster" "redshift_bad" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  tags = {
    yor_trace = "047e2c41-4c56-4ece-bb5b-76f5f19be77a"
  }
}

resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = "vault-name"
    schedule          = "cron(0 12 * * ? *)"
  }
  tags = {
    yor_trace = "858fcd4a-8b3d-47f3-8de6-3f22f3880970"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_redshift_cluster.redshift_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
  ]
}