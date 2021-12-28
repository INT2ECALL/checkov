variable "tags" {}


resource "aws_s3_bucket" "bucket" {
  bucket = "its.a.bucket"
  # NOTE: Prior to find_var_blocks handling vars in parameters, this didn't work
  tags = merge(var.tags, { "more_tags" = "yes" }, {
    yor_trace = "e645bdfb-5a57-47d7-82f5-e95e6ade2eed"
  })
}