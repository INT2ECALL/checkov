# pass

resource "aws_ssm_document" "enabled" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "${var.kms_key_id}",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "9649fc22-8902-4f7f-8a3c-7662c5ba31ff"
  }
}

resource "aws_ssm_document" "enabled_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: '${var.kms_key_id}'
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "907d86f2-43a7-4079-a828-6d02b12ad6d8"
  }
}

# failure

resource "aws_ssm_document" "disabled" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "d2f7cf39-1ccb-4d59-9c79-cf026ed918e3"
  }
}

resource "aws_ssm_document" "disabled_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "84c9cb44-8b07-4633-8d1d-939d711a9777"
  }
}
