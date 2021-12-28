# pass

resource "aws_timestreamwrite_database" "enabled" {
  database_name = "timestream"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "7c967632-6942-42ed-a4bb-ddd8e6d2e462"
  }
}

# failure

resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
  tags = {
    yor_trace = "d8826ed8-d37e-4ab3-810a-b96ed65faa0f"
  }
}
