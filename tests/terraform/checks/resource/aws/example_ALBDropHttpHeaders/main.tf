# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "f26d8ae3-d0fe-44a2-9e69-8f82a2156a40"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "7074e93b-0088-4544-9b4e-3e37527afc04"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "fd4c7935-5aa4-4a76-b522-c22e93ef3220"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "4d6508bc-debf-4664-9fea-055be8b58d05"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "d0c6b6ff-600c-4650-9e57-1b32da5d6efb"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "a30471d4-0dc9-4746-b659-f14a313f1772"
  }
}

# unknown

resource "aws_lb" "network" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "1bff0f7d-de36-484c-a892-133675aaffb8"
  }
}

resource "aws_lb" "gateway" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "e56252a8-e8df-461f-9ce5-fafb9e2f49b3"
  }
}
