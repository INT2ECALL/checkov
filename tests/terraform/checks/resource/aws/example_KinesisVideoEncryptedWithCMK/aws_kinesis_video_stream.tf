resource "aws_kinesis_video_stream" "pass" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
  kms_key_id              = aws_kms_key.default.id
  tags = {
    yor_trace = "520cf2d2-4de4-43b1-87e1-0378f505968c"
  }
}

resource "aws_kinesis_video_stream" "fail" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
  tags = {
    yor_trace = "c28f2342-1a40-4a8d-b7c8-767ed203a3ac"
  }
}