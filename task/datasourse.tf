
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}
data "oci_core_images" "compute_images" {
  compartment_id = var.compartment_ocid
  operating_system = var.instance_os
  operating_system_version = var.linux_os_version
  shape = var.instance_shape
  sort_by = "TIMECREATED"
  sort_order = "DESC"
}