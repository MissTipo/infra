terraform {
  required_version = ">= 1.6.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.50.0"
    }
  }
  backend "oci" {}
}

resource "oci_load_balancer_load_balancer" "lb" {
  compartment_id = var.compartment_ocid
  display_name   = var.lb_name
  subnet_ids     = var.subnet_ids
  shape          = "flexible"

  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100
  }

  is_private = var.is_private
}

resource "oci_load_balancer_backend_set" "backend_set" {
  load_balancer_id = oci_load_balancer_load_balancer.lb.id
  name             = var.backend_set_name
  policy           = "ROUND_ROBIN"

  health_checker {
    protocol          = "HTTP"
    url_path          = "/"
    port              = var.backend_port
    interval_ms       = 10000
    timeout_in_millis = 10000
    retries           = 3
  }
}

resource "oci_load_balancer_backend" "backend" {
  load_balancer_id = oci_load_balancer_load_balancer.lb.id
  backendset_name = oci_load_balancer_backend_set.backend_set.name
  ip_address       = var.backend_ip
  port             = var.backend_port
  weight           = 1
}

resource "oci_load_balancer_listener" "listener" {
  load_balancer_id         = oci_load_balancer_load_balancer.lb.id
  name                     = var.listener_name
  protocol                 = "HTTP"
  port                     = var.listener_port
  default_backend_set_name = oci_load_balancer_backend_set.backend_set.name
}
