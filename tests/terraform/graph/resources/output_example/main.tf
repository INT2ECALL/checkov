module "submodule" {
  source = "submodule"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = module.submodule.vpc_id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    yor_trace = "6f0f6a58-c166-4b54-8d3e-e7e95b1bacbc"
  }
}