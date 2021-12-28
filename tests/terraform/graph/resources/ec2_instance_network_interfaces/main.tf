resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "67699d59-aa86-4993-a2de-44b6c89abda6"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "4def46ef-9690-42bc-a481-8b9a6dd11415"
  }
}

resource "aws_network_interface" "network_interface_foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "primary_network_interface"
    Env       = "prod"
    yor_trace = "7fe21528-3663-4af8-95a1-2d119e708ed1"
  }
}

resource "aws_network_interface" "network_interface_goo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "secondary_network_interface"
    Env       = "dev"
    yor_trace = "98634dd7-ba11-4c8e-a245-15a88981628e"
  }
}

resource "aws_instance" "instance_foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    yor_trace = "c216cfcf-d30e-4f27-a85e-6e51e9823fe3"
  }
}

resource "aws_instance" "instance_bar" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Env       = "prod"
    yor_trace = "ef454fb2-a089-49fe-aeb1-4536fced47f5"
  }
}

resource "aws_vpc" "other_vpc" {
  cidr_block = "124.16.0.0/16"

  tags = {
    Name      = "not_connected"
    yor_trace = "d5ff1aef-7b76-4166-a70b-fa51111d7937"
  }
}