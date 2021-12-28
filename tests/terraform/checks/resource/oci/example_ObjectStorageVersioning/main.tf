resource "oci_objectstorage_bucket" "pass" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = var.bucket_access_type
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "19126281-66ba-4d39-9129-1d0d40743005"
  })
  kms_key_id            = var.oci_kms_key.id
  metadata              = var.metadata
  storage_tier          = var.bucket_storage_tier
  object_events_enabled = true

  retention_rules {
    display_name = var.retention_rule_display_name

    duration {
      time_amount = var.retention_rule_duration_time_amount
      time_unit   = var.retention_rule_duration_time_unit
    }
    time_rule_locked = var.retention_rule_time_rule_locked
  }

  versioning = "Enabled"
}


resource "oci_objectstorage_bucket" "fail" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = var.bucket_access_type
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "3694bba1-689f-411d-81c3-671d6084baff"
  })
  kms_key_id            = var.oci_kms_key.id
  metadata              = var.metadata
  storage_tier          = var.bucket_storage_tier
  object_events_enabled = false

  retention_rules {
    display_name = var.retention_rule_display_name

    duration {
      time_amount = var.retention_rule_duration_time_amount
      time_unit   = var.retention_rule_duration_time_unit
    }
    time_rule_locked = var.retention_rule_time_rule_locked
  }

  versioning = "Disabled"
}

resource "oci_objectstorage_bucket" "default" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = var.bucket_access_type
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "5a805e10-aad3-4153-a212-a4ddc70761a9"
  })
  kms_key_id            = var.oci_kms_key.id
  metadata              = var.metadata
  storage_tier          = var.bucket_storage_tier
  object_events_enabled = false

  retention_rules {
    display_name = var.retention_rule_display_name

    duration {
      time_amount = var.retention_rule_duration_time_amount
      time_unit   = var.retention_rule_duration_time_unit
    }
    time_rule_locked = var.retention_rule_time_rule_locked
  }
}