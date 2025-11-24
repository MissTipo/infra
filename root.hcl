# Root Terragrunt configuration shared across environments

locals {
  region        = "af-johannesburg-1"
  project       = "infra-as-code"
  tenancy_ocid  = get_env("OCI_TENANCY_OCID", "")
  user_ocid     = get_env("OCI_USER_OCID", "")
  compartment_ocid = get_env("OCI_COMPARTMENT_OCID", "")
  fingerprint   = get_env("OCI_FINGERPRINT", "")
  private_key   = get_env("OCI_PRIVATE_KEY_PATH", "")
  bucket_name   = "infra-tfstate"
  namespace     = "axwvu4d0fqgg"
}

# Remote state configuration (OCI Object )
remote_state {
  backend = "oci"
  config = {
    bucket         = local.bucket_name
    namespace      = local.namespace
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region

    # Authentication
    auth           = "ApiKey"
    tenancy_ocid  = local.tenancy_ocid
    user_ocid     = local.user_ocid
    fingerprint   = local.fingerprint
    private_key_path = local.private_key
  }
}

# Expose locals to children
inputs = {
  region     = local.region
  project    = local.project
  compartment_ocid  = local.compartment_ocid
  tenancy_ocid      = local.tenancy_ocid
  user_ocid         = local.user_ocid
  fingerprint       = local.fingerprint
  private_key_path  = local.private_key
  bucket_name       = local.bucket_name
  namespace         = local.namespace
}

