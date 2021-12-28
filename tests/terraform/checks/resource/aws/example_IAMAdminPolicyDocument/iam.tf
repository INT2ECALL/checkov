resource "aws_iam_policy" "pass1" {
  name   = "pass1"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket*",
        "s3:HeadBucket",
        "s3:Get*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "arn:aws:s3:::b2",
        "arn:aws:s3:::b2/*"
      ],
      "Sid": ""
    },
    {
      "Action": "s3:PutObject*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::b1/*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "c4558d95-c059-47aa-bd76-86fc6075e77a"
  }
}

resource "aws_iam_policy" "fail1" {
  name = "fail1"
  path = "/"
  # the policy doesn't actually make sense, but it tests checking arrays for *
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:HeadBucket",
        "*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "55a3e1d9-be7b-4d82-aff5-2022474a3efe"
  }
}

resource "aws_iam_policy" "fail2" {
  name   = "fail2"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "6ffe7b15-11cb-44b3-ba8e-bf771fc06980"
  }
}

resource "aws_iam_policy" "fail3" {
  name   = "fail3"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "a46bfe1e-4cd8-4c8d-9a22-10bca81ae8f3"
  }
}

resource "aws_iam_policy" "fail4" {
  name = "fail4"
  path = "/"
  # implicit allow, not actually valid, but it's a default that we check
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "e2f0d53d-621f-4d4f-9e98-b0210739801d"
  }
}

resource "aws_iam_policy" "pass2" {
  name = "pass2"
  path = "/"
  # deny
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Deny",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "dc271204-5f51-4b0c-8a55-bba8a0c97b87"
  }
}


resource "aws_ssoadmin_permission_set_inline_policy" "pass1" {
  instance_arn       = aws_ssoadmin_permission_set.example.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.example.arn
  inline_policy      = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket*",
        "s3:HeadBucket",
        "s3:Get*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "arn:aws:s3:::b2",
        "arn:aws:s3:::b2/*"
      ],
      "Sid": ""
    },
    {
      "Action": "s3:PutObject*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::b1/*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_ssoadmin_permission_set_inline_policy" "fail1" {
  instance_arn       = aws_ssoadmin_permission_set.example.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.example.arn
  inline_policy      = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:HeadBucket",
        "*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}