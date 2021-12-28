resource "aws_cloudwatch_log_group" "example" {
  name = "Example"
  tags = {
    yor_trace = "d18c35e4-731d-4600-beec-5e303785bb6e"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_ok" {
  name                       = "tf-trail-foobar"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.example.arn}:*"
  tags = {
    yor_trace = "1335e2ba-5d37-44f1-b6b1-0652a8872e09"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_not_ok" {
  name = "tf-trail-foobar"
  tags = {
    yor_trace = "d6baa968-c12d-4989-bb1e-d2eece5d1885"
  }
}