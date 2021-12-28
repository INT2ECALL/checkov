resource "aws_api_gateway_rest_api" "pass" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "1213aa26-d2a4-4340-b91e-564180e0e252"
  }
}

resource "aws_api_gateway_rest_api" "private" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["PRIVATE"]
  }
  tags = {
    yor_trace = "a34399e3-2eb9-4170-b6b6-7ab0c8f083ba"
  }
}

resource "aws_api_gateway_rest_api" "no_stage" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "5d216bef-0906-4cb0-99e6-3c4cb4cb12b3"
  }
}

resource "aws_api_gateway_rest_api" "no_assoc" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "b2ac6395-549a-45e0-a2e3-975d6207bca6"
  }
}

resource "aws_api_gateway_stage" "no_assoc" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_assoc.id
  stage_name    = "example"
  tags = {
    yor_trace = "32fbac26-4a5d-4ba3-95cf-246815c74fd0"
  }
}

resource "aws_api_gateway_stage" "private" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.private.id
  stage_name    = "example"
  tags = {
    yor_trace = "32f43524-b8ea-432d-93cf-bca5146b46a5"
  }
}

resource "aws_api_gateway_stage" "no_api" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_api.id
  stage_name    = "example"
  tags = {
    yor_trace = "caf375bf-d5e0-4c97-b7b2-2c6cec3e967d"
  }
}

resource "aws_api_gateway_stage" "pass" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.pass.id
  stage_name    = "example"
  tags = {
    yor_trace = "7ead225e-256a-4ede-afe2-82f9f8edf8d9"
  }
}

resource "aws_wafregional_web_acl_association" "pass" {
  resource_arn = aws_api_gateway_stage.pass.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}
