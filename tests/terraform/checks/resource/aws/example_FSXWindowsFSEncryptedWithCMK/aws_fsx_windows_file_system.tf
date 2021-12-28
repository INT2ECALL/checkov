resource "aws_fsx_windows_file_system" "pass" {
  active_directory_id = aws_directory_service_directory.test.id
  kms_key_id          = aws_kms_key.test1.arn
  skip_final_backup   = true
  storage_capacity    = 32
  subnet_ids          = [aws_subnet.test1.id]
  throughput_capacity = 8
  tags = {
    yor_trace = "189fa9d0-1f6e-44d8-9b5b-21894fac6057"
  }
}

resource "aws_fsx_windows_file_system" "fail" {
  active_directory_id = aws_directory_service_directory.test.id
  skip_final_backup   = true
  storage_capacity    = 32
  subnet_ids          = [aws_subnet.test1.id]
  throughput_capacity = 8
  tags = {
    yor_trace = "1b307d8e-98d5-45a8-b4e5-efeee8536424"
  }
}