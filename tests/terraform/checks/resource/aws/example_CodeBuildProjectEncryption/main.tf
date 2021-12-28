resource "aws_codebuild_project" "fail" {
  name = "fail-project"
  artifacts {
    type                = S3
    encryption_disabled = true
  }

  tags = {
    yor_trace = "b00d6fc3-e3eb-40d7-bfd4-8a4648aad8eb"
  }
}

resource "aws_codebuild_project" "no_artifacts_encryption_ignored" {
  name = "no-art-project"
  artifacts {
    type                = "NO_ARTIFACTS"
    encryption_disabled = true
  }
  tags = {
    yor_trace = "0649cdd9-1591-441a-8df6-deff6d34bcd7"
  }
}

resource "aws_codebuild_project" "success_no_encryption_disabled" {
  name = "default-project"
  artifacts {
    type = "S3"
  }
  tags = {
    yor_trace = "d141dffb-8bfc-45ec-88ea-4fc6efe51f9c"
  }
}

resource "aws_codebuild_project" "success" {
  name = "success-project"
  artifacts {
    type                = "S3"
    encryption_disabled = false
  }
  tags = {
    yor_trace = "edef42ff-3bc5-42bf-9dd8-2462d8197e89"
  }
}
