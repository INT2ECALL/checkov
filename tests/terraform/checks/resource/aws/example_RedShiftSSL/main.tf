
resource "aws_redshift_parameter_group" "failasfalse" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "false"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "62b4457e-d192-434d-bffa-c0ab98e37539"
  }
}


resource "aws_redshift_parameter_group" "fail" {
  name   = var.param_group_name
  family = "redshift-1.0"

  tags = {
    yor_trace = "7d432ee7-5044-4ba3-bb1b-369317d7de61"
  }
}


resource "aws_redshift_parameter_group" "pass" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "true"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "e5d98766-2ab3-4486-96a0-455dbd40cb7c"
  }
}

resource "aws_redshift_parameter_group" "passbutbool" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = true
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "0c3bdcf0-e531-487f-966a-3b42c9568c64"
  }
}