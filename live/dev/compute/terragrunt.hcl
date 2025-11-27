include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/compute"
}

inputs = {
  environment          = "dev"
  # compartment_ocid     = local.compartment_ocid
  availability_domain  = "zLDZ:AF-JOHANNESBURG-1-AD-1"
  subnet_ocid          = "ocid1.subnet.oc1.af-johannesburg-1.aaaaaaaatfyba4qklkr5elq2tnw4qgu4mgc3d5ybnryexv35iygeym5ewmqa"
  assign_public_ip     = true
  ssh_public_key       = "~/.ssh/id_rsa.pub"
  image_ocid           = get_env("OCI_IMAGE_OCID")


  tenancy_ocid       = get_env("OCI_TENANCY_OCID")
  user_ocid          = get_env("OCI_USER_OCID")
  fingerprint        = get_env("OCI_FINGERPRINT")
  private_key_path   = get_env("OCI_PRIVATE_KEY_PATH")
}

