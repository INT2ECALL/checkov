resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "98b87293-b61e-44cb-8f10-b74b1e9a7d43"
  }
}

resource "aws_vpc" "not_ok_vpc_2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "50aaa296-a11d-4a20-922b-73b79414a508"
  }
}

resource "aws_vpc" "not_ok_vpc_3" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "50846892-28a6-488e-aa7a-adbb4fad1753"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "f6321cc5-5a92-4197-80ea-7dd67fa4b9a5"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "2c375b04-28f3-4516-900d-cfe9a8db7182"
  }
}

resource "aws_default_security_group" "default_2" {
  vpc_id = aws_vpc.not_ok_vpc_2.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "682df5e3-14b4-463a-989e-0f470c982d6e"
  }
}

resource "aws_default_security_group" "default_3" {
  vpc_id = aws_vpc.not_ok_vpc_3.id
  tags = {
    yor_trace = "9f275f79-dea6-4267-8bc1-5493298792aa"
  }
}

resource "aws_security_group_rule" "default_sg_rule" {
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type              = "-1"
  security_group_id = aws_default_security_group.default_3.id
}
