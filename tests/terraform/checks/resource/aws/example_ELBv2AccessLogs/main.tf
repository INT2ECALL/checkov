# pass

resource "aws_lb" "enabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "9536e2d7-0806-4474-935e-1f4bddf34ed2"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "427772de-51be-49d0-a768-d1854d51798a"
  }
}

# failure

resource "aws_lb" "default" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "da4664bd-c058-4f75-9d65-cc254267529c"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "c10f486a-6e30-4858-a9e2-c0ed4c5dba5c"
  }
}

resource "aws_lb" "only_bucket" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "9d2fde0c-4d26-4c42-ad90-0b84f033124e"
  }
}

resource "aws_alb" "only_bucket" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "dbf53fc6-aaee-44fa-bafa-2e78ce100714"
  }
}

resource "aws_lb" "disabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "d0f8173a-9d59-4853-a509-651f355af2cf"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "3b1d7c10-3fb1-45d5-9041-60fbb209e44b"
  }
}

# unknown

resource "aws_lb" "gateway" {
  name               = "glb"
  load_balancer_type = "gateway"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "34a87496-3daf-4578-b19b-1a7b6df6fb58"
  }
}

