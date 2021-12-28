resource "aws_kms_key" "pass_0" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "f1309a44-c712-4392-8359-8f6de18aa0f8"
  }
}

resource "aws_kms_key" "pass_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "9b231c3e-0715-462d-9496-d742793326ba"
  }
}

resource "aws_kms_key" "pass_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "c1c41f86-3892-4099-9b0c-e5676edc6da7"
  }
}

resource "aws_kms_key" "pass_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "62939921-9636-4916-889b-db3a2fd2acc9"
  }
}
