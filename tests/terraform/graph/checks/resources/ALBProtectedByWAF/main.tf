resource "aws_lb" "lb_good_1" {
  internal = false
  tags = {
    yor_trace = "ea465b41-78fb-4ae7-8fda-b03f317ed569"
  }
}

resource "aws_lb" "lb_good_2" {
  internal = false
  tags = {
    yor_trace = "fc10a0ff-e6d7-4aaf-bcf3-93a8bce500b2"
  }
}

resource "aws_alb" "alb_good_1" {
  internal = false
  tags = {
    yor_trace = "0d8e05c4-c71d-4bb2-834a-8d4a1f819b8b"
  }
}

resource "aws_wafregional_web_acl_association" "foo" {
  resource_arn = aws_lb.lb_good_1.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}

resource "aws_wafv2_web_acl_association" "bar" {
  resource_arn = aws_lb.lb_good_2.arn
  web_acl_arn  = aws_wafv2_web_acl.bar.arn
}

resource "aws_wafv2_web_acl_association" "zed" {
  resource_arn = aws_alb.alb_good_1.arn
  web_acl_arn  = aws_wafv2_web_acl.zed.arn
}

//public no WAF
resource "aws_lb" "lb_bad_1" {
  internal = false
  tags = {
    yor_trace = "9a2f99de-9d3c-4384-8aab-359896882659"
  }
}

//internal should ignore
resource "aws_lb" "ignore" {
  internal = true
  tags = {
    yor_trace = "9bb5b51a-b779-4595-9ecd-977e4d2bada8"
  }
}

//public internal not set (takes default - public)
resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "daf997c6-a079-427e-a9ae-e26ff499dd3c"
  }
}

//public no WAF
resource "aws_alb" "alb_bad_1" {
  internal = false
  tags = {
    yor_trace = "f2a2bbfb-2eaa-4680-8c78-bf4f6f89a72a"
  }
}