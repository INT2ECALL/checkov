#
# WARNING: Line numbers mater in this test!
#          Update test_module_skip if a change is made!
#

module "test_module" {
  source = "./module"

  #checkov:skip=CKV_AWS_19:Skip encryption
}

resource "aws_s3_bucket" "outside" {
  bucket = "outside-bucket"

  #checkov:skip=CKV_AWS_19:Skip encryption
  tags = {
    yor_trace = "b6608bb1-3765-4ef7-8228-03338d1f5c85"
  }
}
