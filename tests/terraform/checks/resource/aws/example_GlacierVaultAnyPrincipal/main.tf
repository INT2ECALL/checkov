# pass
resource "aws_glacier_vault" "my_archive1" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Deny",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "65ffa966-c375-48a1-8544-abbd079e716a"
  }
}

# fail
resource "aws_glacier_vault" "my_archive2" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": [
                "arn:aws:iam::123456789101:role/vault-reader", 
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "d650fa7d-7a79-4075-bbb3-1902c3c6e3c7"
  }
}

# fail
resource "aws_glacier_vault" "my_archive3" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": { 
            "AWS": "arn:aws:iam::*:role/vault-reader"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "60cedc60-9bc4-49c7-b160-f2140f1e4231"
  }
}

# fail
resource "aws_glacier_vault" "my_archive4" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": "*"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "61a19738-1b7d-414e-a596-28200cef0440"
  }
}

# fail
resource "aws_glacier_vault" "my_archive5" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "b0a3a2cb-8b3e-4c0b-a50d-4bc1c2cf8268"
  }
}

# pass
resource "aws_glacier_vault" "my_archive6" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "arn:aws:iam::123456789101:role/vault-reader",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "1e5d0290-7eb4-4d2a-8ad5-081c54773f6d"
  }
}