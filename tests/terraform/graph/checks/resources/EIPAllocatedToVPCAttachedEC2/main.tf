resource "aws_eip" "ok_eip" {
  instance = aws_instance.ec2.id
  vpc      = true
  tags = {
    yor_trace = "0646efeb-abbd-41f6-af70-7ccd61381e2b"
  }
}

resource "aws_instance" "ec2" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "ab38852d-854a-4c6b-8e76-f0c5048aea60"
  }
}

resource "aws_eip" "not_ok_eip" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.10"
  tags = {
    yor_trace = "5708a1df-000b-4146-b8e5-12ceaaacb6d1"
  }
}

# via aws_eip_association

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_assoc.id
  allocation_id = aws_eip.ok_eip_assoc.id
}

resource "aws_instance" "ec2_assoc" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "Assoc"
    yor_trace = "a42d67fa-599b-4b56-9e58-41e2b6ed3277"
  }
}

resource "aws_eip" "ok_eip_assoc" {
  vpc = true
  tags = {
    yor_trace = "5bd8df6d-b723-462d-9c31-8a6356e75bfb"
  }
}

# via aws_nat_gateway

resource "aws_eip" "ok_eip_nat" {
  vpc = true
  tags = {
    yor_trace = "b62b04a6-04f7-45dd-9210-cc5eb565b238"
  }
}

resource "aws_nat_gateway" "ok_eip_nat" {
  allocation_id = aws_eip.ok_eip_nat.id
  subnet_id     = "aws_subnet.public.id"
  tags = {
    yor_trace = "98e5c4f2-a873-4e94-8cfa-2e183217a31c"
  }
}

resource "aws_transfer_server" "transfer_server_vpc" {
  count                  = local.count
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "VPC"

  endpoint_details {
    address_allocation_ids = aws_eip.eip_ok_transer_server.*.id[count.index]
  }
  tags = {
    yor_trace = "7b38495d-01cf-4741-978d-fb36f6f24fcd"
  }
}

resource "aws_eip" "eip_ok_transer_server" {
  count = local.count
  vpc   = true
  tags = {
    yor_trace = "bbc705c8-2e2f-4cba-a159-d5a6cb851a5c"
  }
}

resource "aws_eip" "ok_eip_module" {
  count    = 1
  instance = module.example[count.index].instance_id
  vpc      = true
  tags = {
    yor_trace = "8a73f5d4-8708-451a-aa9d-356ef9acce45"
  }
}

resource "aws_eip" "ok_eip_data" {
  instance = data.aws_instance.id
  vpc      = true
  tags = {
    yor_trace = "83cb20df-97b2-4f62-b78e-ebeb98b3066c"
  }
}
