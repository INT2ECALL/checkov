resource "aws_security_group" "failed_cidr_blocks" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  }
  tags = {
    yor_trace = "3be5f856-f70c-4728-b82b-213fc9d22680"
  }
}

resource "aws_security_group" "passed_cidr_block" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  }
  tags = {
    yor_trace = "3d1a3d4d-c388-44ee-aae6-a17f8b2046dd"
  }
}