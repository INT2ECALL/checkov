# Do not add more files to this directory.

resource "aws_elb" "learn" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "e90b9226-2fdf-4709-b85f-d1ab63a50b0f"
  }
}

resource "aws_elb" "learn1" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "86ca4244-bedb-432a-946c-ce23b48c7574"
  }
}

resource "aws_elb" "learn2" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "7cbb4928-18c5-4a60-857b-6d50b18bf623"
  }
}
