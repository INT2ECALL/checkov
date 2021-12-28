resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_good.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_good" {
  name = "test-user"
  tags = {
    yor_trace = "bb4eeb51-258d-4a81-884c-3339200041d7"
  }
}

resource "aws_iam_user" "user_bad" {
  name = "test-user-two"
  tags = {
    yor_trace = "684a2364-4bbb-4672-ada9-43dcdffeae99"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name  = "tf-testing-group-membership"
  users = []
  group = aws_iam_group.bad_group.name
}

resource "aws_iam_group" "bad_group" {
  name = "test-group"
}