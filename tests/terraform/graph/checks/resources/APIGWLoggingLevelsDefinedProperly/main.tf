resource "aws_api_gateway_rest_api" "ok_example" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "ok_example"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "ok_example"
  tags = {
    yor_trace = "8f988e0d-ff36-411a-b608-81efe69f2ba3"
  }
}

resource "aws_api_gateway_deployment" "ok_example" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.ok_example.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "ok_example" {
  deployment_id = aws_api_gateway_deployment.ok_example.id
  rest_api_id   = aws_api_gateway_rest_api.ok_example.id
  stage_name    = "ok_example"
  tags = {
    yor_trace = "df7ad1cb-df06-46ab-8459-3549e2546f9e"
  }
}

resource "aws_api_gateway_method_settings" "all" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id
  stage_name  = aws_api_gateway_stage.ok_example.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = "ERROR"
  }
}

resource "aws_api_gateway_method_settings" "path_specific" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id
  stage_name  = aws_api_gateway_stage.ok_example.stage_name
  method_path = "path1/GET"

  settings {
    metrics_enabled = true
    logging_level   = "INFO"
  }
}

# Bad Example 1 - Not connected or connected with wrong logs errors


resource "aws_api_gateway_deployment" "not_connected" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.not_connected.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "not_connected" {
  deployment_id = aws_api_gateway_deployment.not_connected.id
  rest_api_id   = aws_api_gateway_rest_api.not_connected.id
  stage_name    = "not_connected"
  tags = {
    yor_trace = "2ef3713d-c347-41df-96ed-02ffc4ff5af4"
  }
}

resource "aws_api_gateway_method_settings" "all" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = "ERROR"
  }
}

resource "aws_api_gateway_method_settings" "path_specific" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id
  stage_name  = aws_api_gateway_stage.not_connected.stage_name
  method_path = "path1/GET"

  settings {
    metrics_enabled = true
    logging_level   = "DEBUG"
  }
}