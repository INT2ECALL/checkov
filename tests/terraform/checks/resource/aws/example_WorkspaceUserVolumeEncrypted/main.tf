resource "aws_workspaces_workspace" "pass" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  user_volume_encryption_enabled = true
  volume_encryption_key          = var.volume_encryption_key

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = merge(var.common_tags, {
    yor_trace = "e4f8a475-a966-43e4-b4a1-77897444496a"
  })
}

resource "aws_workspaces_workspace" "fail" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = merge(var.common_tags, {
    yor_trace = "76f28dab-1453-471d-a232-c67d8f81875c"
  })
}
