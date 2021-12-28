#
# WARNING: Line numbers mater in this test!
#          Update test_module_skip if a change is made!
#

# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "inside" {
  bucket = "inside-bucket"
  tags = {
    yor_trace = "db640609-62ed-4362-9b08-3326e282dbc9"
  }
}

resource "aws_s3_bucket" "inside2" {
  bucket = "inside-bucket-2"
  tags = {
    yor_trace = "023d83ed-a17d-43db-9aef-88a8a8da9577"
  }
}

module "another_module" {
  source = "../another/module"
}
