resource "aws_kms_key" "pass1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    yor_trace = "4fdf99f5-2c3d-4636-82cf-41295e28b91a"
  }
}

resource "aws_kms_key" "pass2" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "RSA_2096"
  tags = {
    yor_trace = "94040a11-0ca8-408b-bb38-3585f1e09578"
  }
}

resource "aws_kms_key" "pass3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = true
  tags = {
    yor_trace = "c4a55e6e-019f-4bd0-af0a-be2231f9c13a"
  }
}

resource "aws_kms_key" "fail1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  tags = {
    yor_trace = "2d666645-e356-4a72-96c7-09532f707f81"
  }
}

resource "aws_kms_key" "fail2" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = false
  tags = {
    yor_trace = "f0f2aaca-d669-47c0-bae1-37a0732731ff"
  }
}

resource "aws_kms_key" "fail3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = false
  tags = {
    yor_trace = "39fc8141-8c0e-4a8d-8972-1dc8ad2575d5"
  }
}

resource "aws_kms_key" "fail4" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  tags = {
    yor_trace = "3bf7aa6e-9355-49d2-819a-560ddbfcec29"
  }
}