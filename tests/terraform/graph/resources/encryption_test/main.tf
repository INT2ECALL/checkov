resource "aws_rds_cluster" "rds_cluster_encrypted" {
  cluster_identifier = "some-encrypted-id"
  kms_key_id         = "some-kms-key-id"
  tags = {
    yor_trace = "6e05633c-cd29-4565-a459-9fd9678c8004"
  }
}

resource "aws_rds_cluster" "rds_cluster_unencrypted" {
  cluster_identifier = "some-unencrypted-id"
  tags = {
    yor_trace = "f1f2f483-7d96-4f10-afc4-bb4df2f39f5e"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "5d958be4-2942-4e29-8273-33a7e6367799"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  versioning {
    enabled = True
  }
  tags = {
    yor_trace = "6b697d31-1d70-4b96-a551-fa33bbced0c4"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  cluster_identifier = "encrypted-neptune"
  storage_encrypted  = true
  tags = {
    yor_trace = "3113b937-a785-48b0-a84e-2d53c666b213"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  cluster_identifier = "unencrypted-neptune"
  tags = {
    yor_trace = "05d52229-c86e-4526-9deb-9633fd0f12ec"
  }
}
