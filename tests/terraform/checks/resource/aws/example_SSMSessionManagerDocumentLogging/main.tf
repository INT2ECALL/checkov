# pass

resource "aws_ssm_document" "s3_enabled_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "example",
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
    yor_trace = "1d47b8a0-4c4b-4eef-afc7-28b52d268f00"
  }
}

resource "aws_ssm_document" "s3_enabled_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: 'example'
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
    yor_trace = "501e9246-04b0-4079-b3ce-c4106aed1e18"
  }
}

resource "aws_ssm_document" "cw_enabled_encrypted" {
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
      "cloudWatchLogGroupName": "example",
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
    yor_trace = "07b8cf3e-cfdd-44a4-8924-807e9a586abf"
  }
}

resource "aws_ssm_document" "cw_enabled_encrypted_yaml" {
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
    cloudWatchLogGroupName: 'example'
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
    yor_trace = "01049bcb-244d-44d6-b819-34599676af5f"
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
    yor_trace = "24e2a3e9-f213-46da-9e86-495c403767bb"
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
    yor_trace = "731821ac-fdae-4324-b484-e0b0c54051d3"
  }
}

resource "aws_ssm_document" "s3_enabled_not_encrypted" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "example",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": false,
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
    yor_trace = "18941139-f258-4fd8-9c2c-f098be1128b4"
  }
}

resource "aws_ssm_document" "s3_enabled_not_encrypted_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: 'example'
    s3KeyPrefix: ''
    s3EncryptionEnabled: false
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
    yor_trace = "b2cf4b06-4c3a-4dc8-a6c8-56073ee14ed6"
  }
}

resource "aws_ssm_document" "cw_enabled_not_encrypted" {
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
      "cloudWatchLogGroupName": "example",
      "cloudWatchEncryptionEnabled": false,
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
    yor_trace = "137ab6e2-e55a-4d1d-9663-61797712dfd3"
  }
}

resource "aws_ssm_document" "cw_enabled_not_encrypted_yaml" {
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
    s3EncryptionEnabled: false
    cloudWatchLogGroupName: 'example'
    cloudWatchEncryptionEnabled: false
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
    yor_trace = "80c30575-4376-4f76-b886-63a3fb8b2b0c"
  }
}
