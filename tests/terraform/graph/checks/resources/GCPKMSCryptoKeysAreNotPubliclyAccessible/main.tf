resource "google_kms_key_ring" "keyring" {
  name     = "keyring-example"
  location = "global"
}


resource "google_kms_crypto_key" "key_good_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "a4bb4db0-928b-44c6-ada8-137d029e6136"
  }
}

resource "google_kms_crypto_key" "key_bad_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "2a19e9da-edff-4061-9543-aa606697c619"
  }
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "82be397f-ecbf-47d6-922f-d12bc3b36327"
  }
}

resource "google_kms_crypto_key_iam_member" "crypto_key_good" {
  crypto_key_id = google_kms_crypto_key.key_good_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "user:jane@example.com"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_1" {
  crypto_key_id = google_kms_crypto_key.key_bad_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allUsers"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_2" {
  crypto_key_id = google_kms_crypto_key.key_bad_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allAuthenticatedUsers"
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "82be397f-ecbf-47d6-922f-d12bc3b36327"
  }
}

resource "google_kms_crypto_key" "key_good_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "7f5308ee-7ba5-4e9f-b105-74ba869ce509"
  }
}

resource "google_kms_crypto_key" "key_bad_3" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "1a0814f6-d4c3-4a98-9067-3cd19fd802f6"
  }
}

resource "google_kms_crypto_key" "key_bad_4" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "f013f891-5b9d-4267-9b02-124737307a1f"
  }
}


resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_good_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_3.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allUsers",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_4.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allAuthenticatedUsers",
  ]
}
