# Resource names in this file are **important**
# Encrypted resources _must_ start their name with the word "encrypted"
resource aws_ecr_repository "encrypted_repo" {
  name = "nimtest-repo"
  encryption_configuration {
    encryption_type = "AES256"
  }
  tags = {
    yor_trace = "6273aac7-4984-4664-98f8-53052c023de8"
  }
}

resource aws_ecr_repository "unencrypted_repo" {
  name = "nimtest-repo-unencrypted"
  tags = {
    yor_trace = "176adee7-7e97-42a1-8cf4-28613ffb92e5"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  storage_encrypted   = true
  skip_final_snapshot = true
  tags = {
    yor_trace = "e618a920-82dd-461e-89ff-8b960ef0acb4"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  storage_encrypted   = false
  skip_final_snapshot = true
  tags = {
    yor_trace = "71ff52c0-d16f-40b6-8461-af69b9cfbe0e"
  }
}

resource "aws_efs_file_system" "encrypted_file_system" {
  encrypted = true
  tags = {
    yor_trace = "8a93fab7-e2fd-4cb6-b94d-fb22ce1471f6"
  }
}

resource "aws_efs_file_system" "unencrypted_file_system" {
  tags = {
    yor_trace = "0f4fffc3-a542-4482-ae14-d32f50eb6fce"
  }
}

resource "aws_ebs_volume" "encrypted_volume" {
  availability_zone = "us-east-1a"
  encrypted         = true
  size              = 8
  tags = {
    yor_trace = "f7caef0f-1062-4379-a4f9-b7d96e58be9f"
  }
}

resource "aws_ebs_volume" "unencrypted_volume" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    yor_trace = "f30ff901-a3c6-48cb-98d5-62edf42512f8"
  }
}

resource "aws_ebs_volume" "unencrypted_volume2" {
  availability_zone = "us-east-1a"
  encrypted         = false
  size              = 8
  tags = {
    yor_trace = "9bc501e3-854f-466d-a2e6-c9e8754d75e1"
  }
}

resource "aws_elasticache_replication_group" "encrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  at_rest_encryption_enabled    = true
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "1bb3e17c-a222-4873-aa63-b7aec3f6966f"
  }
}

resource "aws_elasticache_replication_group" "unencrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "32c27506-9138-476c-90a7-edd8cbcb6cc7"
  }
}

resource "aws_elasticsearch_domain" "encrypted_domain" {
  domain_name = "nimtest-encryption-test"
  encrypt_at_rest {
    enabled = true
  }
  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "a37e40a6-a33b-4833-a74c-e5ac5fbfea83"
  }
}

resource "aws_elasticsearch_domain" "unencrypted_domain" {
  domain_name = "nimtest-encryption-test"
  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "5aa71e76-1de1-4e45-b1ae-930eb8071d97"
  }
}

resource "aws_msk_cluster" "encrypted_msk" {
  cluster_name           = ""
  kafka_version          = ""
  number_of_broker_nodes = 0
  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }

  encryption_info {
    encryption_in_transit {
      in_cluster    = true
      client_broker = "TLS"
    }
    encryption_at_rest_kms_key_arn = "KMS"
  }
  tags = {
    yor_trace = "4619d936-98cb-4365-83f2-3279f85f9c25"
  }
}

resource "aws_kinesis_stream" "encrypted_stream" {
  name            = "nimtest"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "e5daf023-df74-49ed-8c7f-3f5ce087a866"
  }
}

resource "aws_kinesis_stream" "unencrypted_stream" {
  name        = "nimtest"
  shard_count = 1
  tags = {
    yor_trace = "e8280531-1e32-49e4-b2da-7e0d4dbf89a1"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  bucket = "unencrypted"
  tags = {
    yor_trace = "192de0bb-758d-4aa0-9d43-f1d76622257a"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  tags = {
    yor_trace = "9fc35dd0-4fba-4be5-9ec6-fbacfff24d9a"
  }
}

resource "aws_s3_bucket" "encrypted_bucket_2" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "d3a63374-2c33-430c-a5cc-288c28bd81b7"
  }
}

resource "aws_s3_bucket_object" "encrypted_object_by_itself" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"

  server_side_encryption = "AES256"
  tags = {
    yor_trace = "41b2de65-9504-495a-822a-68ad5f243612"
  }
}

resource "aws_s3_bucket_object" "unencrypted_object_by_bucket" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"
  tags = {
    yor_trace = "413f0da2-8279-4fe4-8088-57423f7514a9"
  }
}

resource "aws_sns_topic" "encrypted_topic" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "fb2576d4-830e-4ebd-90fc-1c1c80d7b022"
  }
}

resource "aws_sns_topic" "unencrypted_topic" {
  name = "unencrypted"
  tags = {
    yor_trace = "61625828-c2f1-492c-8c1b-873a2a2c55f8"
  }
}

resource "aws_sqs_queue" "encrypted_queue" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "b5a93589-8a6f-4c4f-a3b4-7cb714b89412"
  }
}

resource "aws_sqs_queue" "unencrypted_queue" {
  name = "unencrypted"
  tags = {
    yor_trace = "d2fa2268-5d3e-40a5-88c4-d3da32d5a4f4"
  }
}

resource "aws_cloudwatch_log_group" "encrypted_by_default_cloudwatch_log_group" {
  name = "group"
  tags = {
    yor_trace = "4e774d1e-0677-4bd8-910a-fa5cc953182c"
  }
}

resource "aws_cloudwatch_log_group" "encrypted" {
  name       = "group"
  kms_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "4651cb83-af9b-40f9-96cc-eae1610cbcf1"
  }
}

resource "aws_cloudtrail" "encrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  kms_key_id     = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "efc7425d-def5-41fb-ad2a-7804fdae0d01"
  }
}

resource "aws_cloudtrail" "unencrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  tags = {
    yor_trace = "db56bb3a-b215-46be-99f7-63aafe8d129a"
  }
}

resource "aws_dynamodb_table" "encrypted" {
  name     = "encrypted"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "7d77ebd9-ec7a-4494-ad87-f94c84e79e2e"
  }
}

resource "aws_dynamodb_table" "encrypted_by_default_dynamodb_table" {
  name     = "encrypted_by_default"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  tags = {
    yor_trace = "ce3a0d41-8645-4edb-8741-dfb3d403970f"
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = ""
  tags = {
    yor_trace = "576c1f9e-8232-4138-affe-f0b35260413f"
  }
}

resource "aws_docdb_cluster" "encrypted_docdb" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "483d0a06-d449-45fe-a8b3-02f0ea6f7f72"
  }
}

resource "aws_docdb_cluster" "unencrypted_docdb" {
  storage_encrypted = false
  tags = {
    yor_trace = "6d70fed5-20fe-448d-9eb9-649997fca6da"
  }
}

resource "aws_codebuild_project" "encrypted_project" {
  name         = "encrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }

  encryption_key = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "e8c53b30-ec66-47ba-9f46-8f0d7b47fb45"
  }
}

resource "aws_codebuild_project" "unencrypted_project" {
  name         = "unencrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }
  tags = {
    yor_trace = "7fb05f2e-0b76-4714-a3b1-52415b3ef0d1"
  }
}

resource "aws_codebuild_report_group" "encrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = false
      encryption_key      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "088d5a61-f6de-49be-a9b9-40211e785874"
  }
}

resource "aws_codebuild_report_group" "unencrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = true
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "e2dc7d8b-04f2-47b9-86be-7d2b3442ea38"
  }
}

resource "aws_athena_database" "encrypted_athena_database" {
  bucket = ""
  name   = "encrypted"
  encryption_configuration {
    encryption_option = "SSE_S3"
  }
}

resource "aws_athena_database" "unencrypted_athena_database" {
  bucket = ""
  name   = "unencrypted"
}

resource "aws_athena_workgroup" "encrypted_workgroup" {
  name = "encrypted"
  configuration {
    result_configuration {
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      }
    }
  }
  tags = {
    yor_trace = "f8b23ad4-e79f-4eb8-94a2-64b5f80692a2"
  }
}

resource "aws_athena_workgroup" "unencrypted_workgroup" {
  name = "unencrypted"
  tags = {
    yor_trace = "8e5d2460-a037-48fa-8e81-57149e7819aa"
  }
}

resource "aws_eks_cluster" "encrypted_eks" {
  name     = ""
  role_arn = ""
  vpc_config {
    subnet_ids = []
  }

  encryption_config {
    resources = []
    provider {
      key_arn = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
    }
  }
  tags = {
    yor_trace = "cd0f1632-01cc-49d9-9504-bd966de54404"
  }
}

resource "aws_db_instance" "encrypted_instance" {
  instance_class = ""

  storage_encrypted = true
  tags = {
    yor_trace = "cc5b894c-1eb1-4d2c-a4d9-125c946cc0b6"
  }
}

resource "aws_db_instance" "unencrypted_instance" {
  instance_class = ""

  storage_encrypted = false
  tags = {
    yor_trace = "76f87dbd-f2b9-4f4c-9d14-c5b920433f46"
  }
}

resource "aws_rds_cluster" "encrypted_rds_cluster" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "9a94e439-8400-4e31-849d-cf65771c4215"
  }
}

resource "aws_rds_cluster" "unencrypted_rds_cluster" {
  tags = {
    yor_trace = "8cd418d0-662e-4364-912d-8363698e91d3"
  }
}

resource "aws_rds_global_cluster" "encrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = true
}

resource "aws_rds_global_cluster" "unencrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = false
}

resource "aws_s3_bucket_inventory" "encrypted_s3_inventory" {
  bucket                   = ""
  included_object_versions = ""
  name                     = ""
  destination {
    bucket {
      bucket_arn = ""
      format     = ""
      encryption {
        sse_s3 {}
      }
    }
  }
  schedule {
    frequency = ""
  }
}

resource "aws_dax_cluster" "encrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "2a7fea84-3a99-4224-ae38-92242a20d2e5"
  }
}

resource "aws_dax_cluster" "unencrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "8ec7f57d-7de3-47e9-9bac-fb3ea7b8ca98"
  }
}

resource "aws_redshift_cluster" "encrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  encrypted          = true
  tags = {
    yor_trace = "7589dd29-2e5b-4c49-a9b5-811d84d32f95"
  }
}

resource "aws_redshift_cluster" "unencrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  tags = {
    yor_trace = "407e0331-005c-4b4f-b5d8-16e17334903f"
  }
}
