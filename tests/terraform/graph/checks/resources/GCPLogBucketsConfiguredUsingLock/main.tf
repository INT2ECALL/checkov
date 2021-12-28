resource "google_logging_organization_sink" "org_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_1.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_2.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_project_sink" "project_sink_good_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_good.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_1.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_2" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_2.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}


resource "google_logging_organization_sink" "org_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_1.name
}

resource "google_logging_organization_sink" "org_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_2.name
}

resource "google_storage_bucket" "log_bucket_good" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = true
  }
  labels = {
    yor_trace = "e899fd39-2d56-4f5f-bf2c-1ae01c4b29a8"
  }
}


resource "google_storage_bucket" "log_bucket_bad_1" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = false
  }
  labels = {
    yor_trace = "7ca4153b-94e3-41c5-831a-529bc91a5c4f"
  }
}

resource "google_storage_bucket" "log_bucket_bad_2" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
  }
  labels = {
    yor_trace = "29a0f5b4-6d8e-4f92-a9f6-3a1738dd9d7e"
  }
}
