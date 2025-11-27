variable "region" {}
variable "project" {}
variable "environment" {}
variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key" {}
# variable "image_ocid" {}

variable "availability_domain" {
  description = "OCI availability domain (e.g. Uocm:SA-JOHANNESBURG-1-AD-1)"
}

variable "shape" {
  description = "Compute shape"
  default     = "VM.Standard.E2.1.Micro"
  # default     = "Canonical-Ubuntu-24.04-2025.10.31-0"
}

variable "subnet_ocid" {
  description = "Subnet OCID for the VM"
}

variable "assign_public_ip" {
  description = "Whether to give the instance a public IP"
  type        = bool
  default     = false
}

variable "ssh_public_key" {
  description = "Path to your SSH public key"
}

variable "image_ocid" {
  description = "OCID of the image to use for the instance"
  type        = string
}

