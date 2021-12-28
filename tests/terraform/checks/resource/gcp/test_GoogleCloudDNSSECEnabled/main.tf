resource "google_dns_managed_zone" "private1" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  labels = {
    yor_trace = "56f16dff-e000-4de3-a743-c9b86cc44e73"
  }
}

resource "google_dns_managed_zone" "private2" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "0249ea63-161f-4258-aed0-c41031bd792c"
  }
}

resource "google_dns_managed_zone" "private3" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "off"
  }

  labels = {
    yor_trace = "4416ac02-ee54-401c-8f97-55824601836a"
  }
}

resource "google_dns_managed_zone" "pass1" {
  # Pass because visibility is public and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "3752b747-50d2-4bff-aed8-865c86402192"
  }
}

resource "google_dns_managed_zone" "pass2" {
  # Pass because visibility is public (by default) and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "48d24725-c514-4f8c-8cbb-9410408a110d"
  }
}

resource "google_dns_managed_zone" "fail1" {
  # Fail because visibility is public and dnssec block is missing
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  labels = {
    yor_trace = "c0a66fd1-6a1a-44d4-803a-6427605e7093"
  }
}

resource "google_dns_managed_zone" "fail2" {
  # Fail because visibility is public and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"
  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "121da162-5295-4297-8566-619c95c2bb17"
  }
}

resource "google_dns_managed_zone" "fail3" {
  # Fail because visibility is public (by default) and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "6f2fbc70-532c-4b66-a996-8ceb90702e81"
  }
}