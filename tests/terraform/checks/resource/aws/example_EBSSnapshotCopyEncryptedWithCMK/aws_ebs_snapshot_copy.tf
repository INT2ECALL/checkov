resource "aws_ebs_snapshot_copy" "pass" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true
  kms_key_id         = aws_kms_key.test.arn

  tags = {
    Name      = "testAccEBSSnapshotCopyWithKMSConfig"
    yor_trace = "cfe9d95e-706c-4023-a5b1-6fbbe8a59028"
  }
}

resource "aws_ebs_snapshot_copy" "fail" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true

  tags = {
    Name      = "testAccEBSSnapshotCopyWithKMSConfig"
    yor_trace = "0dfa2245-8ec8-4256-884f-d2bee1ce56c6"
  }
}
