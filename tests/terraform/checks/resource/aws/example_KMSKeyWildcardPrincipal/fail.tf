resource "aws_kms_key" "fail_0" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    },   
  ]
}
POLICY  
  tags = {
    yor_trace = "181773af-773b-4377-9091-0a264c2713e0"
  }
}

resource "aws_kms_key" "fail_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "57e11f90-5204-4b8e-acbc-771c14d466c9"
  }
}

resource "aws_kms_key" "fail_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "2eab04db-559d-490c-8110-fe5f6cd9e5e7"
  }
}

resource "aws_kms_key" "fail_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "5e1fef8b-929c-4314-b4dd-2e261dd2133a"
  }
}

resource "aws_kms_key" "fail_4" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [ 
          "arn:aws:iam::111122223333:root",
          "*"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }   
  ]
}
POLICY  
  tags = {
    yor_trace = "e7a9d7cc-9dd1-4524-a5d6-3365f093c474"
  }
}
