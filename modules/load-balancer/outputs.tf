output "load_balancer_public_ip" {
  value = oci_load_balancer_load_balancer.lb.ip_address_details[0].ip_address
}

output "load_balancer_id" {
  value = oci_load_balancer_load_balancer.lb.id
}

output "listener" {
  value = oci_load_balancer_listener.listener.name
}

output "backend_set" {
  value = oci_load_balancer_backend_set.backend_set.name
}


