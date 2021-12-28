# fail
resource "aws_backup_vault" "backup" {
  name = "example_backup_vault"
  tags = {
    yor_trace = "612d9fc7-a5f3-4cce-95f0-d975fef61cbf"
  }
}

# pass
resource "aws_backup_vault" "backup_with_kms_key" {
  name        = "example_backup_vault"
  kms_key_arn = aws_kms_key.example.arn
  tags = {
    yor_trace = "d2e7f510-6b89-46ef-845a-29f065b17b99"
  }
}