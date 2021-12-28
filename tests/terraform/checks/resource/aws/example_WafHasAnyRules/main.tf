
//global
resource "aws_waf_web_acl" "fail" {
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }
  tags = {
    yor_trace = "808c60ae-da33-4c40-9705-28873f9e7220"
  }
}

resource "aws_waf_web_acl" "fail2" {
  name        = "tfWebACLfail2"
  metric_name = "tfWebACLfail2"

  default_action {
    type = "ALLOW"
  }
  rules {

  }
  tags = {
    yor_trace = "1148f232-70cc-4928-97b5-5c6547a0e3a0"
  }
}

provider "aws" {
  region = "us-east-1"
}

//global
resource "aws_waf_web_acl" "pass" {
  name        = "tfWebACLpass"
  metric_name = "tfWebACLpass"

  default_action {
    type = "ALLOW"
  }

  rules {
    priority = 1
    rule_id  = "30231cc1-ae2d-44e9-8212-dfb6185288a8"
    type     = "REGULAR"

    action {
      type = "BLOCK"
    }
  }
  tags = {
    yor_trace = "0ce1531b-42ca-4ef2-ba7a-4c7928050fdf"
  }
}

resource "aws_wafregional_web_acl" "pass" {
  name        = "tfWebACLregional"
  metric_name = "tfWebACLregional"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_wafregional_rule.wafrule.id
    type     = "REGULAR"
  }
  tags = {
    yor_trace = "52d473c6-c24b-4214-ad31-fc66583fad3a"
  }
}

resource "aws_wafregional_web_acl" "fail" {
  name        = "tfWebACLregionalfail"
  metric_name = "tfWebACLregionalfail"

  default_action {
    type = "ALLOW"
  }

  tags = {
    yor_trace = "0d1ae018-07f0-4a7f-aac2-a8145ba32dcc"
  }
}

resource "aws_wafregional_web_acl" "fail2" {
  name        = "tfWebACLregionalfail2"
  metric_name = "tfWebACLregionalfail2"

  default_action {
    type = "ALLOW"
  }

  rule {
  }
  tags = {
    yor_trace = "3556083a-8d61-4e69-825f-0840a5cd521e"
  }
}

