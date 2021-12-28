resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_one" {
  name = "test-user"
  tags = {
    yor_trace = "2a49d226-a55b-4f96-a984-ebd1e175070b"
  }
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
  tags = {
    yor_trace = "635fb538-845a-486c-9fcc-49921ed40b63"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name = "tf-testing-group-membership"


  group = aws_iam_group.bad_group.name
}


resource "aws_iam_group" "bad_group" {
  name = "test-group"
}