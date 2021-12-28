resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "cb5c2ef8-0618-49d1-b39f-2fa8808e4646"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "37ab2552-3f46-4b08-b8f3-69a54be11560"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "ab30533d-b110-40bd-9278-48f35647293f"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "706a46de-6ba0-4c4d-85b4-21f74ce26768"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "ba231535-00a6-44a0-835d-9a1e39764b6f"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "7a9ed8ff-56c9-42d7-90dc-a5a782231fef"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "39d97110-d360-429d-822c-f7a715cc86ce"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "74a4ae5f-3d93-4888-9ed3-ffe50338e3f0"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "7ad0e1a6-c61f-4cdd-9129-31462c1015a7"
  }
}