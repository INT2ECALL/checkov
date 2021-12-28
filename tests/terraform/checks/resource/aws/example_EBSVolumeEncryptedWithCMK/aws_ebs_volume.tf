resource "aws_ebs_volume" "pass" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true
  kms_key_id        = aws_kms_key.test.arn

  tags = {
    Name      = "taggy"
    yor_trace = "cb8c44d6-88e1-41e7-9528-6aab682cb893"
  }
}

resource "aws_ebs_volume" "fail" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true

  tags = {
    Name      = "taggy"
    yor_trace = "0c572087-bf6b-4cad-94ea-2c7cedba8ab6"
  }
}