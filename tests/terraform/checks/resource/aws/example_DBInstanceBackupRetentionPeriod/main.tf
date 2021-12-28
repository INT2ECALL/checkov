resource "aws_rds_cluster" "pass" {
  backup_retention_period = 35
  tags = {
    yor_trace = "eb275464-43f3-459b-8120-f2b0a6307f5b"
  }
}

resource "aws_rds_cluster" "pass2" {
  tags = {
    yor_trace = "4a9dad52-cfb3-4e10-9ea0-a99cc40694e8"
  }
}

resource "aws_rds_cluster" "fail2" {
  backup_retention_period = 0
  tags = {
    yor_trace = "1c43140a-9372-40e3-8202-492ab3fe0221"
  }
}

#this will fail in tf i dont know why we even bother?
resource "aws_rds_cluster" "fail" {
  backup_retention_period = 36
  tags = {
    yor_trace = "e08f31da-1b7a-47a5-9196-bc955c1c2ae7"
  }
}

resource "aws_db_instance" "pass" {
  backup_retention_period = 35
  tags = {
    yor_trace = "793d35e1-9f56-46ce-a13c-8b1dcb3cdcc5"
  }
}

resource "aws_db_instance" "pass2" {
  tags = {
    yor_trace = "082739c9-af42-4440-90b2-b79ebd22aa74"
  }
}

resource "aws_db_instance" "fail2" {
  backup_retention_period = 0
  tags = {
    yor_trace = "b0c88de4-5e04-4f5d-bc84-d4cebe87e19b"
  }
}

#this will fail in tf i dont know why we even bother?
resource "aws_db_instance" "fail" {
  backup_retention_period = 36
  tags = {
    yor_trace = "a586f280-9312-4b93-9af4-a98dd52ccb8b"
  }
}
