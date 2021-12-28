resource "aws_guardduty_detector" "ok" {
  enable = true
  tags = {
    yor_trace = "1fb014bc-fe0c-401a-8a7b-ea862f463a0a"
  }
}

resource "aws_guardduty_detector" "not_ok" {
  enable = true
  tags = {
    yor_trace = "a201e0be-3989-43c9-aab4-ffce8decc8f7"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = true
  detector_id = aws_guardduty_detector.ok.id
}

resource "aws_guardduty_detector" "not_ok_false" {
  enable = true
  tags = {
    yor_trace = "bf1c817f-9339-4c03-bb2d-05103fff8d9a"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = false
  detector_id = aws_guardduty_detector.not_ok_false.id
}