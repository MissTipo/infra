terraform {
  backend "oci" {}
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0.0"
    }
  }
}

resource "oci_identity_compartment" "iam_compartment" {
  name          = var.compartment_name
  description   = var.compartment_description
  compartment_id = var.parent_compartment_ocid
}

resource "oci_identity_group" "admin_group" {
  name           = var.admin_group_name
  description    = "Administrators group"
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_policy" "admin_policy" {
  name           = "${var.admin_group_name}-policy"
  description    = "Policy granting admin privileges"
  compartment_id = oci_identity_compartment.iam_compartment.id

  statements = [
    "Allow group ${var.admin_group_name} to manage all-resources in compartment ${var.compartment_name}"
  ]
}

