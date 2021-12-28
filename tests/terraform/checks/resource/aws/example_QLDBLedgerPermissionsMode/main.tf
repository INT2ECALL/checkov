# pass

resource "aws_qldb_ledger" "standard" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "c4cebec4-01e8-4eaf-8cb4-0d19832385ac"
  }
}

# failure

resource "aws_qldb_ledger" "allow_all" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"
  tags = {
    yor_trace = "2f6e7d11-9329-4b16-b604-6ebb468cf76b"
  }
}
