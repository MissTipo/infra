variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key" {}
variable "region" {}

variable "compartment_ocid" {}
variable "cluster_name" {}
variable "vcn_id" {}
variable "kubernetes_version" {}

variable "endpoint_subnet_id" {
  type = string
}

variable "service_lb_subnet_ids" {
  type = list(string)
}

variable "nodepool_name" {}
variable "node_shape" {}
variable "quantity_per_subnet" { default = 1 }

variable "subnet_ids" {
  type = list(string)
}

variable "node_subnet_id" {
  type = string
}

variable "availability_domain" {}
variable "node_pool_size" {}
variable "image_id" {}

variable "boot_volume_size_in_gbs" { default = 50 }
variable "node_memory_in_gbs" { default = 16 }
variable "node_ocpus"          { default = 2 }
variable "ssh_public_key" {}

