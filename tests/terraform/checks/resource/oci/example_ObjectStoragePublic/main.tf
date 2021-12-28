resource "oci_objectstorage_bucket" "pass" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  #access_type           = var.bucket_access_type
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "977287ce-64db-4750-8fc6-4e1177c1227c"
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

  versioning = true
}

resource "oci_objectstorage_bucket" "pass2" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = "NoPublicAccess"
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "a71ee9b6-8031-4a5d-b14f-848b0262b755"
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

  versioning = true
}

resource "oci_objectstorage_bucket" "fail" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = "ObjectReadWithoutList"
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "e58627e5-59ac-4b6c-8a4b-ac52279f7221"
  })
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

  versioning = false
}


resource "oci_objectstorage_bucket" "fail2" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type  = "ObjectRead"
  defined_tags = var.defined_tags
  freeform_tags = merge(var.freeform_tags, {
    yor_trace = "dc1348c6-3ddb-4752-afd4-91b2813b27cd"
  })
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

  versioning = false
}