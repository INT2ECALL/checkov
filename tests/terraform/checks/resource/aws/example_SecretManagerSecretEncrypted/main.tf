# pass

resource "aws_secretsmanager_secret" "enabled1" {
  name = "secret"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "82acea03-017e-4c12-9473-d7293daccf8e"
  }
}

resource "aws_secretsmanager_secret" "enabled2" {
  name = "secret"

  kms_key_id = "1234"
  tags = {
    yor_trace = "f65d2294-a082-423d-9e8d-cb8abc52a10f"
  }
}

# failure

resource "aws_secretsmanager_secret" "default" {
  name = "secret"
  tags = {
    yor_trace = "aeda8d3e-d94a-4c17-a2e6-d4be963f3d29"
  }
}

resource "aws_secretsmanager_secret" "default_explicit" {
  name       = "secret"
  kms_key_id = "alias/aws/secretsmanager"
  tags = {
    yor_trace = "581b53c3-feb0-4386-86d0-c7f857ab24e0"
  }
}
