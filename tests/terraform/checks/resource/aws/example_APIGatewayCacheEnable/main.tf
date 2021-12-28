resource "aws_api_gateway_stage" "pass" {
  name                  = "example"
  cache_cluster_enabled = true
  tags = {
    yor_trace = "80221768-958f-48c2-8232-03f01b6968d1"
  }
}

resource "aws_api_gateway_stage" "fail" {
  name = "example"
  tags = {
    yor_trace = "dd14ea89-24dd-4839-b0d9-128042a133d2"
  }
}


