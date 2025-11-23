# Network module outputs

# VCN
output "vcn_id" {
  description = "The OCID of the Virtual Cloud Network (VCN)"
  value       = oci_core_virtual_network.vcn.id
}

# Subnets
output "public_subnet_id" {
  description = "The OCID of the public subnet"
  value       = oci_core_subnet.public.id
}

output "private_subnet_id" {
  description = "The OCID of the private subnet"
  value       = oci_core_subnet.private.id
}

# Route tables
output "public_route_table_id" {
  description = "The OCID of the public route table"
  value       = oci_core_route_table.public.id
}

output "private_route_table_id" {
  description = "The OCID of the private route table"
  value       = oci_core_route_table.private.id
}

# Security lists
output "public_security_list_id" {
  description = "The OCID of the public security list"
  value       = oci_core_security_list.public.id
}

output "private_security_list_id" {
  description = "The OCID of the private security list"
  value       = oci_core_security_list.private.id
}

# Convenience output
output "module_ready" {
  description = "Indicates that the network module has been successfully created"
  value       = true
}

