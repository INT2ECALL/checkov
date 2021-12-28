resource "google_project" "project_good_1" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "a74a4450-1338-45b4-a8b5-6b4d99f3002c"
  }
}

resource "google_project" "project_good_2" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "b2b0627d-56f4-44c3-a220-3d4367cd157b"
  }
}

resource "google_project" "project_bad_1" {
  name       = "My Project"
  project_id = "bad"
  org_id     = "1234567"
  labels = {
    yor_trace = "244a160a-3e0f-441c-9b48-fafd65332365"
  }
}

resource "google_compute_network" "vpc_network_network" {
  name                    = "vpc-legacy"
  auto_create_subnetworks = true
  project                 = google_project.project_bad_1.id
}

resource "google_compute_network" "vpc_network_1" {
  name    = "vpc-legacy"
  project = google_project.project_good_1.id
}

resource "google_compute_network" "vpc_network_2" {
  name                    = "vpc-legacy"
  project                 = google_project.project_good_1.id
  auto_create_subnetworks = false
}