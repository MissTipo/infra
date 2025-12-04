# IAM compartment ID
output "iam_compartment_id" {
  value = oci_identity_compartment.iam_compartment.id
  description = "The OCID of the IAM compartment created for dev environment"
}

# Admin group ID
output "admin_group_id" {
  value = oci_identity_group.admin_group.id
}

# Admin policy ID
output "admin_policy_id" {
  value = oci_identity_policy.admin_policy.id
}

# Placeholder for future DNS credentials
output "dns_service_account" {
  value       = ""
  description = "Placeholder for ExternalDNS service account or IAM role"
}

# Placeholder for future Vault endpoint
output "vault_endpoint" {
  value       = ""
  description = "Placeholder for Vault endpoint to be used by ExternalSecrets"
}

