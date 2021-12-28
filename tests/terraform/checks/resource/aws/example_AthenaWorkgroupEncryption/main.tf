resource "aws_athena_workgroup" "pass" {
  name = "wg-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "mykmsarn"
      }
    }
  }
  tags = {
    yor_trace = "6df61bee-d026-4281-a096-4ce5b9fda239"
  }
}

resource "aws_athena_workgroup" "fail" {
  name = "wg-non-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
    }
  }
  tags = {
    yor_trace = "ad9a4b9a-266e-42ee-bdf1-fd9fc4d6c0b4"
  }
}

