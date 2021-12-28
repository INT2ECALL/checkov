resource "aws_flow_log" "example" {
  iam_role_arn    = "arn"
  log_destination = "log"
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "deeba6a4-0e74-4502-9ecd-1885db695cbc"
  }
}

resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "7278edf9-b0e3-4c2e-8312-769772e1af5e"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "7cea512e-de59-48b4-8a4f-02b7401f648d"
  }
}