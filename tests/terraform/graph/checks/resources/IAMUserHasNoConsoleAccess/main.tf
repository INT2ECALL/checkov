# pass

resource "aws_iam_user" "pass" {
  name = "tech-user"
  tags = {
    yor_trace = "940a2ccb-939c-420b-9026-47d5371762d1"
  }
}

# fail

resource "aws_iam_user" "fail" {
  name = "human-user"
  tags = {
    yor_trace = "0323fc46-9d6d-480a-aa05-f4954c054343"
  }
}

resource "aws_iam_user_login_profile" "fail" {
  user    = aws_iam_user.fail.name
  pgp_key = "keybase:human-user"
}
