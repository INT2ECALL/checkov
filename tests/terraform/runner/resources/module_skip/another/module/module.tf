# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "nested-inside" {
  bucket = "nested-inside-bucket"
  tags = {
    yor_trace = "0371211b-e217-448d-b833-28786ecef719"
  }
}

# this module is used to test 3 layers deep
module "module-3" {
  source = "./module-3"
}
