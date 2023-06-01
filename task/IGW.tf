resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  display_name   = "ig-gateway"
  vcn_id         = oci_core_vcn.vcn.id
}