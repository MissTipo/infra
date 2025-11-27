output "instance_id" {
  value = oci_core_instance.compute.id
}

output "public_ip" {
  value = oci_core_instance.compute.public_ip
}

output "private_ip" {
  value = oci_core_instance.compute.private_ip
}

output "instance_name" {
  value = oci_core_instance.compute.display_name
}

