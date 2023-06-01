
#create autonomous database

resource "oci_database_autonomous_database" "Adb" {
  admin_password           = var.Adb_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = var.Adb_database_cpu_core_count
  data_storage_size_in_tbs = var.Adb_database_data_storage_size_in_tbs
  db_name                  = var.Adb_database_db_name
  db_version               = var.Adb_database_db_version
  display_name             = var.Adb_database_display_name
  license_model            = var.Adb_database_license_model
  nsg_ids                  = var.Adb_private_endpoint ? [oci_core_network_security_group.Adb_sg.id] : null
  private_endpoint_label   = var.Adb_private_endpoint ? var.Adb_private_endpoint_label : null
  subnet_id                = var.Adb_private_endpoint ? oci_core_subnet.subnet_3.id : null

  
}