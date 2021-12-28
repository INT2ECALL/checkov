#
# WARNING: Line numbers mater in this test!
#          Update test_module_failure_reporting_772 if a change is made!
#

# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "inside" {
  bucket = "inside-bucket"
  tags = {
    yor_trace = "7b5abef0-765f-43e9-89b9-cc3b7495558b"
  }
}