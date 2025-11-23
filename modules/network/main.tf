terraform {
  required_version = ">= 1.6.0"
  backend "oci" {}
}

# providers
provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key
  region               = var.region
}

# Create a Virtual Cloud Network (VCN)
resource "oci_core_virtual_network" "vcn" {
  cidr_block     = "10.0.0.0/16"
  display_name   = "${var.project}-${var.environment}-vcn"
  compartment_id = var.compartment_ocid
}

# Create an Internet Gateway
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  display_name   = "${var.project}-${var.environment}-igw"
  vcn_id         = oci_core_virtual_network.vcn.id
  enabled     = true
}

# Create a public subnet(leave the first chunk of the VCN (10.0.0.0/24) unused)
resource "oci_core_subnet" "public" {
  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_virtual_network.vcn.id
  cidr_block           = "10.0.1.0/24"
  display_name         = "${var.project}-${var.environment}-public-subnet"
  route_table_id       = oci_core_route_table.public.id
  security_list_ids    = [oci_core_security_list.public.id]
  prohibit_public_ip_on_vnic = false
}

# Create a private subnet
resource "oci_core_subnet" "private" {
  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_virtual_network.vcn.id
  cidr_block           = "10.0.2.0/24"
  display_name         = "${var.project}-${var.environment}-private-subnet"
  route_table_id       = oci_core_route_table.private.id
  security_list_ids    = [oci_core_security_list.private.id]
  prohibit_public_ip_on_vnic = true
}

# Route Tables
resource "oci_core_route_table" "public" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.project}-${var.environment}-public-rt"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_route_table" "private" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.project}-${var.environment}-private-rt"
}

# Security Lists
resource "oci_core_security_list" "public" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.project}-${var.environment}-public-sl"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "6" # TCP
    tcp_options {
      max = 65535
      min = 22 # SSH
    }
  }
}

resource "oci_core_security_list" "private" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.project}-${var.environment}-private-sl"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    source   = oci_core_subnet.public.cidr_block
    protocol = "6" # TCP
  }
}

# # Outputs
# output "vcn_id" {
#   value = oci_core_virtual_network.vcn.id
# }
#
# output "public_subnet_id" {
#   value = oci_core_subnet.public.id
# }
#
# output "private_subnet_id" {
#   value = oci_core_subnet.private.id
# }
