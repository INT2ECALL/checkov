# fail
resource "aws_transfer_server" "example_public" {
  endpoint_type = "PUBLIC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "4fe0fb49-64fd-4773-b4d0-19b1b8c75ae3"
  }
}

# pass
resource "aws_transfer_server" "example_vpc" {
  endpoint_type = "VPC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "f705ee77-47a3-494f-ac0f-d3f70b13bbe7"
  }
}

# fail
resource "aws_transfer_server" "example" {
  protocols = ["SFTP"]
  tags = {
    yor_trace = "fda67218-611d-4827-a60f-2a08d117a1a8"
  }
}