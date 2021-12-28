provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
  alias   = "east1"
}

locals {
  dummy_with_dash = format("-%s", var.dummy_1)
  bucket_name     = var.bucket_name
  x = {
    y = "z"
  }
}
resource "aws_instance" "example" {
  ami           = local.ami_name
  instance_type = module.child.myoutput
  tags = {
    yor_trace = "8429cf50-2685-41fd-bf65-0a8a8df04183"
  }
}

resource "aws_s3_bucket" "template_bucket" {
  provider      = aws.east1
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "45fdcf5c-6b27-4972-b335-1d5e30995581"
  }
}

resource "aws_eip" "ip" {
  vpc      = local.is_vpc
  instance = aws_instance.example.id
  tags = {
    yor_trace = "c224efba-037b-48cb-aae3-d44418c04b46"
  }
}

locals {
  is_vpc   = true
  ami_name = local.dummy_with_dash
}

module "child" {
  source = "./child"
}