# Data form terraform.tf file

variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}

#availability domain

variable "vcn_name" {
    default = "VCN"
}

variable "availability_domain" {
  default = "1"
}

#VCN

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  default = "VCN"
}

variable "subnet_dns_label" {
  default = "subnet"
}

# OS Images
variable "instance_os" {
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  default     = "8"
}

variable "instance_shape" {
  default = "VM.Standard.E2.1.Micro"
}

# variable "instance_core_ocpus" {
#   default = 1
# }

# variable "instance_GB_memory" {
#   default = 1
# # }

# loadbalancer

variable "lb_shape" {
  default = "flexible"
}

variable "flex_lb_min_shape" {
  default = "10"
}

variable "flex_lb_max_shape" {
  default = "10"
}
 # Autonomous database 

variable "Adb_database_db_name" {
  default = "autodb"
}
variable "Adb_database_display_name" {
  default = "autodb"
}

variable "Adb_private_endpoint" {
  default = true
}

 variable "Adb_database_cpu_core_count" {
  default = 1
}

variable "Adb_database_data_storage_size_in_tbs" {
  default = 1
}

variable "Adb_database_db_version" {
  default = "19c"
}
variable "Adb_password" {}

variable "Adb_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "Adb_private_endpoint_label" {
  default = "ATPPrivateEndpoint"
}