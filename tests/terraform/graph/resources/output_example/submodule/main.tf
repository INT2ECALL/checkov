resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "e990fa0f-ed98-475e-8646-49ea48011962"
  }
}