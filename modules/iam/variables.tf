variable "tenancy_ocid" {
  type        = string
  description = "Tenancy OCID"
}

variable "parent_compartment_ocid" {
  type        = string
  description = "Parent compartment OCID, usually the tenancy root"
}

variable "compartment_name" {
  type        = string
  description = "Name of IAM compartment to create"
}

variable "compartment_description" {
  type        = string
  description = "Description for the IAM compartment"
  default     = "IAM resources compartment"
}

variable "admin_group_name" {
  type        = string
  description = "Name of the admin IAM group"
  default     = "cloud-admins"
}

