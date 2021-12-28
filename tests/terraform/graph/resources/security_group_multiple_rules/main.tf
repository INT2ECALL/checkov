resource "aws_security_group" "sg1" {
  description = "sg1"

  egress {
    description = "Self Reference"
    cidr_blocks = ["0.0.0.0/0", "25.0.9.19/92"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Access to Bastion Host Security Group"
    from_port       = "5432"
    protocol        = "tcp"
    security_groups = ["sg-id-0"]
    self            = "false"
    to_port         = "8182"
  }

  egress {
    description = "Self Reference"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Access to Bastion Host Security Group"
    from_port       = "5432"
    protocol        = "tcp"
    security_groups = ["sg-id-0"]
    self            = "false"
    to_port         = "5432"
  }
  tags = {
    yor_trace = "fa8f9f3c-e15a-4879-b6ba-10df683217ed"
  }
}

resource "aws_security_group" "sg2" {
  description = "sg2"

  egress {
    description = "Self Reference"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Access to Bastion Host Security Group"
    from_port       = "5432"
    protocol        = "tcp"
    security_groups = ["sg-id-0"]
    self            = "false"
    to_port         = "1234"
  }

  egress {
    description = "Self Reference"
    cidr_blocks = ["0.0.0.0/0", "8.0.4.19/92"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Access to Bastion Host Security Group"
    from_port       = "5432"
    protocol        = "tcp"
    security_groups = ["sg-id-0"]
    self            = "false"
    to_port         = "5432"
  }
  tags = {
    yor_trace = "772f5918-6d87-4d82-aafb-c3aff4c17d9f"
  }
}
