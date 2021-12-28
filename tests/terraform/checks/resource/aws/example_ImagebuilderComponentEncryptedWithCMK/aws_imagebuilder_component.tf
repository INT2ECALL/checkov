resource "aws_imagebuilder_component" "fail" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  name     = "examplea"
  platform = "Linux"
  version  = "1.0.0"
  tags = {
    yor_trace = "47ed4c16-c0ad-4906-86a6-b926fffe0cc6"
  }
}

resource "aws_imagebuilder_component" "pass" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  kms_key_id = aws_kms_key.test.arn
  name       = "examplea"
  platform   = "Linux"
  version    = "1.0.0"
  tags = {
    yor_trace = "11699c70-ecbc-407e-bb45-219e370caafb"
  }
}