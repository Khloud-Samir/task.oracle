resource "oci_load_balancer_load_balancer" "LB" {
    compartment_id = var.compartment_ocid
    display_name = "LB"
    shape = var.lb_shape
    subnet_ids = [oci_core_subnet.subnet_2.id]

    shape_details {
    
        maximum_bandwidth_in_mbps = var.flex_lb_max_shape
        minimum_bandwidth_in_mbps = var.flex_lb_min_shape
    }
}
resource "oci_load_balancer_backend_set" "backend_set" {
  health_checker {
    #Required
    protocol = "HTTP"
    #Optional
    interval_ms = "10000"
    port = "80"
    response_body_regex = ""
    retries = "3"
    return_code = "200"
    timeout_in_millis = "3000"
    url_path = "/"
  }
  load_balancer_id = oci_load_balancer_load_balancer.LB.id
  name = "backend-set"
  policy = "ROUND_ROBIN"
}

resource "oci_load_balancer_backend" "web_server_01" {
  backendset_name = oci_load_balancer_backend_set.backend_set.name
  ip_address = oci_core_instance.WebServer1.private_ip
  load_balancer_id = oci_load_balancer_load_balancer.LB.id
  port = "80"
  backup = "false"
  drain = "false"
  offline = "false"
}

resource "oci_load_balancer_backend" "web_server_02" {
  backendset_name = oci_load_balancer_backend_set.backend_set.name
  ip_address = oci_core_instance.WebServer2.private_ip
  load_balancer_id = oci_load_balancer_load_balancer.LB.id
  port = "80"
  backup = "false"
  drain = "false"
  offline = "false"
}

