
#WEB TIER
resource "oci_core_subnet" "subnet_1" {
  cidr_block      = "10.0.0.0/24"
  display_name    = "subnet-web"
  compartment_id  = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  route_table_id  = oci_core_route_table.rt-pub.id
  dns_label       = "subnet1"
}
#LB TIER
resource "oci_core_subnet" "subnet_2" {
  cidr_block      = "10.0.1.0/24"
  display_name    = "subnet-LB"
  compartment_id  = var.compartment_ocid
    vcn_id        = oci_core_vcn.vcn.id
  route_table_id  = oci_core_route_table.rt-pub.id
  dns_label       = "subnet2"
}

#privet subnet
resource "oci_core_subnet" "subnet_3" {
  cidr_block                 = "10.0.2.0/24"
  display_name               = "subnet-DB"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.vcn.id
  route_table_id             = oci_core_route_table.rt-priv.id
  dns_label                  = "subnet3"
  prohibit_public_ip_on_vnic = true
}