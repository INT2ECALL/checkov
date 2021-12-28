resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "475f4bb3-8fad-4252-8ba1-ffa2589c44cd"
  }
}

resource "aws_subnet" "subnet_public_ip" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name      = "first-tf-example"
    yor_trace = "7fe0084b-f153-4db3-a874-2537f06fac20"
  }
}

resource "aws_subnet" "subnet_not_public_ip" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "second-tf-example"
    yor_trace = "2d72757e-aa1b-430c-bd06-c581fc9affc2"
  }
}


resource "aws_default_security_group" "default_security_group_open" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "1f8c8cab-362a-4420-901c-066daa543e79"
  }
}

resource "aws_default_security_group" "default_security_group_closed" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol  = -1
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
    yor_trace = "fc342c16-d14d-4f0e-9311-9b8128a5351d"
  }
}

resource "aws_instance" "with_open_def_security_groups" {
  ami           = "ami-0"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_open.id]
  tags = {
    yor_trace = "6747b054-2763-4bb8-8259-fe8fac238f88"
  }
}

resource "aws_instance" "with_closed_def_security_groups" {
  ami           = "ami-1"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_closed.id]
  tags = {
    yor_trace = "7b673188-60af-4152-aeae-f2b3b2835b4d"
  }
}


resource "aws_instance" "with_open_security_groups" {
  ami           = "ami-2"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    yor_trace = "f3817f83-22a2-4887-b937-eaa2718fbfcf"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name      = "allow_tls"
    yor_trace = "9b505a4c-3061-472a-9b30-586a339bae78"
  }
}


resource "aws_instance" "with_subnet_public" {
  ami           = "ami-3"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_public_ip.id
  tags = {
    yor_trace = "72a37346-0768-4ec5-b06a-0b1285f22c54"
  }
}

resource "aws_instance" "with_subnet_not_public" {
  ami           = "ami-4"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_not_public_ip.id
  tags = {
    yor_trace = "5ff52be5-fbca-440f-9f4a-6f885bf97656"
  }
}