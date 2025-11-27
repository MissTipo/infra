terraform {
  backend "oci" {}
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 7.0.0"
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

resource "oci_core_instance" "compute" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = var.assign_public_ip
    # hostname_label   = "${var.project}-${var.environment}-vm"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }

  display_name = "${var.project}-${var.environment}-instance"

  source_details {
    source_type       = "image"
    source_id          = var.image_ocid
  }
}

# output "debug_vars" {
#   value = {
#     private_key_path = var.private_key
#     tenancy_ocid     = var.tenancy_ocid
#     user_ocid        = var.user_ocid
#     fingerprint      = var.fingerprint
#     image           = var.image_ocid
#   }
# }
#


