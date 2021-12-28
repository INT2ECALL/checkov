variable "BUCKET_NAME" {
  type    = string
  default = "this-is-my-default"
}

resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "f767a90f-8caa-4658-aa69-f953c419a160"
  }
}
