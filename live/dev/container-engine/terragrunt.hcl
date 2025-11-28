include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/container-engine/"
}

inputs = {
  environment            = "dev"
  cluster_name           = "infra-as-code-dev-cluster"
  nodepool_name          = "infra-as-code-dev-nodepool"

  compartment_ocid       = get_env("OCI_COMPARTMENT_OCID")
  vcn_id                 = get_env("OCI_VCN_OCID")

  endpoint_subnet_id     = get_env("OCI_ENDPOINT_SUBNET_OCID")
  service_lb_subnet_ids  = [get_env("OCI_SUBNET_OCID")]
  subnet_ids             = [get_env("OCI_NODE_SUBNET_OCID")]
  node_subnet_id         = get_env("OCI_NODE_SUBNET_OCID")
  availability_domain    = get_env("OCI_AVAILABILITY_DOMAIN")
  node_pool_size         = 1
  image_id               = get_env("OCI_NODE_IMAGE_OCID")

  kubernetes_version     = "v1.34.1"
  node_shape             = "VM.Standard3.Flex"
  quantity_per_subnet    = 1
  boot_volume_size_in_gbs = 50
  node_memory_in_gbs     = 16
  node_ocpus             = 2
  ssh_public_key         = "~/.ssh/id_rsa.pub"

  tenancy_ocid           = get_env("OCI_TENANCY_OCID")
  user_ocid              = get_env("OCI_USER_OCID")
  fingerprint            = get_env("OCI_FINGERPRINT")
  private_key            = get_env("OCI_PRIVATE_KEY_PATH")
}

