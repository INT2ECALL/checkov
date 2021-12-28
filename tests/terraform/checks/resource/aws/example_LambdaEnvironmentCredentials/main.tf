# pass

resource "aws_lambda_function" "pass" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"

  environment {
    variables = {
      AWS_DEFAULT_REGION = "us-west-2"
    }
  }
  tags = {
    yor_trace = "49ea97c6-568e-4c49-bd67-4effe9956a17"
  }
}

resource "aws_lambda_function" "no_env" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"
  tags = {
    yor_trace = "08120120-1a32-4d88-a62e-45528fc7ea3b"
  }
}

# fail

resource "aws_lambda_function" "fail" {
  function_name = "stest-env"
  role          = ""
  runtime       = "python3.8"

  environment {
    variables = {
      AWS_ACCESS_KEY_ID     = "AKIAIOSFODNN7EXAMPLE",
      AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      AWS_DEFAULT_REGION    = "us-west-2"
    }
  }
  tags = {
    yor_trace = "091c2a09-6d86-4eff-98b2-adeebe78a422"
  }
}
