resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "e56569a2-025c-449c-8aad-40b3db008755"
  }
}

resource "aws_network_acl" "acl_ok_optionA" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "8ce06eb1-0961-4843-90a7-e5e6240b66a3"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.ok_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "a4fec6d8-38b3-4fa7-ba4b-cbd1d8eae5b3"
  }
}

resource "aws_subnet" "main_optionB" {
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "648b3dc5-aa73-4c2f-b2d3-ac8cbdca1e87"
  }
}

resource "aws_network_acl" "acl_ok_optionB" {
  vpc_id     = aws_vpc.ok_vpc.id
  subnet_ids = [aws_subnet.main_optionB.id]
  tags = {
    yor_trace = "5e7bdcd5-10c5-403c-b10b-205830f723cb"
  }
}


resource "aws_vpc" "bad_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "96f75427-cd27-40d9-b3a9-b86274f4fc3c"
  }
}


resource "aws_network_acl" "acl_bad_A" {
  vpc_id = aws_vpc.bad_vpc.id
  tags = {
    yor_trace = "d19396a4-7659-4d29-9595-bdfba709baeb"
  }
}

resource "aws_network_acl" "acl_bad_B" {

  tags = {
    yor_trace = "1db79fd9-2df1-4be3-acbc-194e90b072ec"
  }
}

resource "aws_vpc" "no_nacl_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "0f34acfe-e87c-4176-a171-71b9b5e552e1"
  }
}

