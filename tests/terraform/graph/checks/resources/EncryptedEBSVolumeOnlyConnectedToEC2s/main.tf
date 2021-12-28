resource "aws_instance" "web" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "29eb44a7-6957-4e0c-b7d6-f53a728933ad"
  }
}

resource "aws_volume_attachment" "not_ok_attachment1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "not_ok_attachment2" {
  device_name = "/dev/sdh2"
  volume_id   = aws_ebs_volume.not_ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "ok_attachment1" {
  device_name = "/dev/sdh3"
  volume_id   = aws_ebs_volume.ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_ebs_volume" "not_ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "a390dc5b-ccd4-457d-8afc-a112620722e9"
  }
}

resource "aws_ebs_volume" "not_ok_ebs2" {
  availability_zone = ""
  encrypted         = false
  tags = {
    yor_trace = "ed9bb7ea-79fb-4ab9-a8f3-011fe1d8e83d"
  }
}

resource "aws_ebs_volume" "ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "0016525e-139c-46b4-9c9a-8fdd3149e6bf"
  }
}

resource "aws_ebs_volume" "ok_ebs2" {
  availability_zone = ""
  encrypted         = true
  tags = {
    yor_trace = "d8feffc0-764b-442f-93f8-1e16e7f99a58"
  }
}


resource "aws_volume_attachment" "ebs_at1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}