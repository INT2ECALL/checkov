# pass

resource "aws_codebuild_project" "enabled" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  encryption_key = "aws_kms_key.scanner_key.id"

  artifacts {
    type = "S3"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "56a9b66f-a737-46ad-8691-d7e5f29b4118"
  }
}

# fail

resource "aws_codebuild_project" "default" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  artifacts {
    type = "S3"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "4d35376a-b9c5-444b-85ed-bef7bdf48878"
  }
}

# unknown

resource "aws_codebuild_project" "no_artifacts" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "d830d079-d676-49b7-ad06-ed2856d25f49"
  }
}
