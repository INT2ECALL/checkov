# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "3aa28df9-ef17-4743-a277-25ce65c8bc59"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "421d4c7c-db0f-44b6-91a0-de5869adbeb9"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "46f91005-1d92-4417-ae62-85425bcf007a"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "3f98f064-68a9-4c59-9e36-4a4c50426cb9"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "d96d6f4c-33e1-4d7c-9c0e-c5f93e55b98a"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "819814a4-9165-4c61-8649-b2f20c4a5407"
  }
}
