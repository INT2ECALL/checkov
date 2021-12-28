resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "dd0d1f59-247a-4044-8c3c-8dacf64b009e"
  }
}
data "aws_caller_identity" "current" {}
