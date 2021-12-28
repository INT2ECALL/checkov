# pass

resource "aws_qldb_ledger" "default" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "ecf250e5-e0bf-4482-b3e2-f811e39ff554"
  }
}

resource "aws_qldb_ledger" "enabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = true
  tags = {
    yor_trace = "d12ef7e6-703c-4144-b0eb-9256cb22c44b"
  }
}

# failure

resource "aws_qldb_ledger" "disabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = false
  tags = {
    yor_trace = "5bda6242-a054-42a3-91e7-370f0b9a0f82"
  }
}
