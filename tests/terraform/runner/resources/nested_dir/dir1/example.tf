resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "1c023458-4c93-45a9-8287-9a263ce20945"
  }
}
data "aws_caller_identity" "current" {}
