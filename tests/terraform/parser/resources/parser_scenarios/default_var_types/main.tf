variable "map_with_default" {
  type    = map(string)
  default = { x = "123" }
}

variable "map_without_default" {
  type = map(string)
}

variable "map_with_default_no_type" {
  type    = map
  default = { x = "123" }
}

variable "map_without_default_no_type" {
  type = map
}

variable "list_with_default" {
  type    = list(string)
  default = ["123"]
}

variable "list_without_default" {
  type = list(string)
}


resource "google_compute_instance" "a" {
  metadata = merge(var.map_with_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "58b9cdcc-8d3f-4ecd-b921-06fbabb1d61b"
  }
}

resource "google_compute_instance" "b" {
  metadata = merge(var.map_without_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "2812edcf-c88c-451c-aaa2-f56868ce05ee"
  }
}

resource "google_compute_instance" "c" {
  metadata = merge(var.map_with_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "d47e459c-6ac8-4217-8993-d192129d49b9"
  }
}

resource "google_compute_instance" "d" {
  metadata = merge(var.map_without_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "2147ee31-4250-4a05-9078-7bd964836270"
  }
}

resource "google_compute_instance" "e" {
  metadata = concat(var.list_with_default, ["xyz"])
  labels = {
    yor_trace = "dbe79aa3-9271-4380-939a-121b9639bcda"
  }
}

resource "google_compute_instance" "f" {
  metadata = concat(var.list_without_default, ["xyz"])
  labels = {
    yor_trace = "2b93038b-eb8f-4c74-b9ff-8b8ab3e87eb5"
  }
}
