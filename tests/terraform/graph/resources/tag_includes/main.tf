resource "aws_instance" "some_instance" {
  ami           = "some_ami"
  instance_type = "t3.nano"
  tags = {
    Name      = "acme-machine"
    yor_trace = "d046c984-2cf5-409c-97c9-990a514b403d"
  }
}

resource "aws_subnet" "acme_subnet" {
  cidr_block = ""
  vpc_id     = ""

  tags = {
    acme      = "true"
    Name      = "notacme-subnet"
    yor_trace = "9c0537e7-068d-4702-b480-c2603068133b"
  }
}

resource "aws_s3_bucket" "acme_s3_bucket" {
  bucket = "acme-123456"
  tags = {
    Environment = "dev"
    yor_trace   = "7918cffb-74ed-4755-b429-8e03b63ba484"
  }
}