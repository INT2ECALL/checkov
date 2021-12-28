resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "6d536652-5e9e-40e3-9cb2-864724f09dfe"
  }
}

resource "aws_security_group" "aws_security_group_public" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "76fe0f62-b874-4d8b-bde4-f560705f3a3f"
  }
}

resource "aws_security_group" "aws_security_group_private" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["25.09.19.92/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "6b200a84-370d-4efb-880f-2ec613fbc0bd"
  }
}

resource "aws_db_security_group" "aws_db_security_group_public" {
  name = "rds_sg"

  ingress {
    cidr = "0.0.0.0"
  }
  tags = {
    yor_trace = "e6ecc530-deab-46bd-be16-97567f3e5348"
  }
}

resource "aws_db_security_group" "aws_db_security_group_private" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
  tags = {
    yor_trace = "c13b7536-0c3a-4a7e-b74c-ce53b79b6ccb"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_public" {
  name = "redshift-sg"

  ingress {
    cidr = "0.0.0.0"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_private" {
  name = "redshift-sg"

  ingress {
    cidr = "25.09.19.92/0"
  }
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_public" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_public.name]
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_private" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_private.name]
}