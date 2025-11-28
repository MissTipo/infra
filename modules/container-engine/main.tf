terraform {
  backend "oci" {}
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key
  region           = var.region
}

resource "oci_containerengine_cluster" "cluster" {
  compartment_id     = var.compartment_ocid
  name               = var.cluster_name
  vcn_id             = var.vcn_id
  kubernetes_version = var.kubernetes_version

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = var.endpoint_subnet_id
  }

  options {
    service_lb_subnet_ids = var.service_lb_subnet_ids
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "oci_containerengine_node_pool" "nodepool" {
  compartment_id      = var.compartment_ocid
  cluster_id          = oci_containerengine_cluster.cluster.id
  name                = var.nodepool_name
  kubernetes_version  = var.kubernetes_version
  node_shape          = var.node_shape

  node_config_details {
    size = var.node_pool_size
    placement_configs {
      availability_domain = var.availability_domain
      subnet_id           = var.node_subnet_id
    }
  }

  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_in_gbs
  }

  node_source_details {
    source_type             = "IMAGE"
    image_id                = var.image_id
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  }

  node_metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }

  initial_node_labels {
    key   = "role"
    value = "worker"
  }
}



