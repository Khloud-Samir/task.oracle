
# LBSecurityGroup
resource "oci_core_network_security_group" "LB_Sg" {
  compartment_id = var.compartment_ocid
  display_name   = "LB_Sg"
  vcn_id         = oci_core_vcn.vcn.id
}

# Rules related to LBSecurityGroup
# EGRESS
resource "oci_core_network_security_group_security_rule" "LBSecurityEgressInternetGroupRule" {
  network_security_group_id = oci_core_network_security_group.LB_Sg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}
# INGRESS
resource "oci_core_network_security_group_security_rule" "LBSecurityIngressGroupRules" {
  network_security_group_id = oci_core_network_security_group.LB_Sg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

# WebSecurityGroup
resource "oci_core_network_security_group" "Web_sg" {
  compartment_id = var.compartment_ocid
  display_name   = "Web_sg"
  vcn_id         = oci_core_vcn.vcn.id
}

# Rules related to WebSecurityGroup
# EGRESS
resource "oci_core_network_security_group_security_rule" "WebSecurityEgressAdbGroupRule" {
  network_security_group_id = oci_core_network_security_group.Web_sg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = oci_core_network_security_group.Adb_sg.id
  destination_type          = "NETWORK_SECURITY_GROUP"
}
resource "oci_core_network_security_group_security_rule" "WebSecurityEgressInternetGroupRule" {
  network_security_group_id = oci_core_network_security_group.Web_sg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = oci_core_subnet.subnet_2.cidr_block
  destination_type          = "CIDR_BLOCK"
}
# INGRESS
resource "oci_core_network_security_group_security_rule" "WebSecurityIngressGroupRules" {
  network_security_group_id = oci_core_network_security_group.Web_sg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = oci_core_subnet.subnet_2.cidr_block
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

# SSHSecurityGroup
resource "oci_core_network_security_group" "SSH_sg" {
  compartment_id = var.compartment_ocid
  display_name   = "SSH_sg"
  vcn_id         = oci_core_vcn.vcn.id
}

# Rules related to SSHSecurityGroup
# EGRESS
resource "oci_core_network_security_group_security_rule" "SSHSecurityEgressGroupRule" {
  network_security_group_id = oci_core_network_security_group.SSH_sg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}
# INGRESS
resource "oci_core_network_security_group_security_rule" "SSHSecurityIngressGroupRules" {
  network_security_group_id = oci_core_network_security_group.SSH_sg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

# AdbSecurityGroup
resource "oci_core_network_security_group" "Adb_sg" {
  compartment_id = var.compartment_ocid
  display_name   = "Adb_sg"
  vcn_id         = oci_core_vcn.vcn.id
}

# Rules related to ATPSecurityGroup
# EGRESS
resource "oci_core_network_security_group_security_rule" "AdbSecurityEgressGroupRule" {
  network_security_group_id = oci_core_network_security_group.Adb_sg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = oci_core_subnet.subnet_1.cidr_block
  destination_type          = "CIDR_BLOCK"
}
# INGRESS
resource "oci_core_network_security_group_security_rule" "AdbSecurityIngressGroupRules" {
  network_security_group_id = oci_core_network_security_group.Adb_sg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = oci_core_subnet.subnet_1.cidr_block
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 1522
      min = 1522
    }
  }
}
