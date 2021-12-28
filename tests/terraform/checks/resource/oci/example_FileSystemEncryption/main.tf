resource "oci_file_storage_file_system" "pass" {
  availability_domain = var.file_system_availability_domain
  compartment_id      = var.compartment_id

  defined_tags = { "Operations.CostCenter" = "42" }
  display_name = var.file_system_display_name
  freeform_tags = { "Department" = "Finance"
    yor_trace = "53f30446-87f7-4724-8b9e-07d5c2d43ef2"
  }
  kms_key_id         = oci_kms_key.test_key.id
  source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}


resource "oci_file_storage_file_system" "fail" {
  availability_domain = var.file_system_availability_domain
  compartment_id      = var.compartment_id

  defined_tags = { "Operations.CostCenter" = "42" }
  display_name = var.file_system_display_name
  freeform_tags = { "Department" = "Finance"
    yor_trace = "6969f0f4-7627-4f48-84db-54403429155e"
  }
  source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}