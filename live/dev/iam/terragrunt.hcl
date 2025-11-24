include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/iam"
}

inputs = {
  # tenancy_ocid             = local.tenancy_ocid
  # parent_compartment_ocid  = local.tenancy_ocid
  compartment_name         = "dev-iam"
  compartment_description  = "IAM resources for dev environment"
  admin_group_name         = "dev-admins"
}

