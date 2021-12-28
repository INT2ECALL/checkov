# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = true
  tags = {
    yor_trace = "23e26b77-e1b0-4cfe-ac41-59380c8de2a4"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = true

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "46848d15-9cf6-4ef1-a42f-fb835e288b75"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "c52074e7-a2f4-4d14-a671-251324d88600"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "b3426918-2144-48a8-b5f0-1e9f48244759"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = false
  tags = {
    yor_trace = "bb6ce824-8b3b-479c-8dd5-fa2bed7c1d58"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = false

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "f773f425-bb13-44f8-9023-28480d0b1e9c"
  }
}

# unknown

resource "aws_lb" "application" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "c5b9f2ed-db1c-4dbb-8276-1d3bb4e538d3"
  }
}

resource "aws_lb" "default_type" {
  internal = false
  name     = "alb"
  subnets  = var.public_subnet_ids
  tags = {
    yor_trace = "a6bb98a1-2761-43e7-9c40-8f647233e5dc"
  }
}
