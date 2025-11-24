output "iam_compartment_id" {
  value = oci_identity_compartment.iam_compartment.id
}

output "admin_group_id" {
  value = oci_identity_group.admin_group.id
}

output "admin_policy_id" {
  value = oci_identity_policy.admin_policy.id
}

