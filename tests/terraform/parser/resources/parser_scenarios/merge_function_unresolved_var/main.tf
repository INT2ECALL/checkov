locals {
  common_tags = {
    Tag1 = "one"
    Tag2 = "two"
  }
}

variable "ENV" {}

resource "aws_s3_bucket" "bucket" {
  # var.ENV has no default, so need to evaluate the merge without the
  # fully resolved statement.
  tags = merge(local.common_tags, { Name = "my-bucket-${var.ENV}" }, {
    yor_trace = "a53762aa-f91c-4a2c-a7c6-d258f1388f81"
  })
}