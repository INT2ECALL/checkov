resource "google_project" "project_good" {
  name       = "good"
  project_id = "123456"
  labels = {
    yor_trace = "1f61ec46-0337-4086-9141-9cfb21759ab1"
  }
}

resource "google_project" "project_bad_1" {
  name       = "bad1"
  project_id = "123456"
  labels = {
    yor_trace = "bd9e081c-0292-4c43-8d7d-bb9f02d9ed45"
  }
}

resource "google_project" "project_bad_2" {
  name       = "bad2"
  project_id = "123456"
  labels = {
    yor_trace = "42ac9a1f-d2c7-469f-95b1-0d99a97e7bd9"
  }
}

resource "google_project" "project_bad_3" {
  name       = "bad3"
  project_id = "123456"
  labels = {
    yor_trace = "e9d50e20-1224-468d-aa7e-090cdcca0b92"
  }
}

resource "google_project_iam_audit_config" "project_good_audit" {
  project = google_project.project_good.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_1" {
  project = google_project.project_bad_1.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:joebloggs@hashicorp.com",
    ]
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_2" {
  project = google_project.project_bad_2.id
  service = "someService"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}