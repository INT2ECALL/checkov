variable "logging_include_cookies" {
  type        = bool
  description = "Whether to enable cookies in access logging"
  default     = null
}

variable "logging_bucket_id" {
  type        = string
  description = "The bucket ID where to store access logs"
  default     = null
}

variable "logging_bucket_prefix" {
  type        = string
  description = "The prefix where to store access logs"
  default     = null
}

resource "aws_cloudfront_distribution" "cf_dis" {
  enabled = true
  logging_config {
    include_cookies = var.logging_include_cookies
    bucket          = var.logging_bucket_id
    prefix          = var.logging_bucket_prefix
  }
  tags = {
    yor_trace = "0211b499-be63-491a-9a33-eba2d9a97c29"
  }
}


resource "aws_s3_bucket" "website_bucket" {
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "0563e7d5-a1d2-445d-949a-23318d833938"
  }
}

variable "versioning" {
  default = null
}