variable "region" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "lb_name" {
  type = string
}

variable "is_private" {
  type    = bool
  default = false
}

variable "backend_set_name" {
  type = string
}

variable "backend_ip" {
  type = string
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "listener_name" {
  type = string
}

variable "listener_port" {
  type    = number
  default = 80
}

variable "backend_sets" {
  type = list(object({
    name           = string
    policy         = string
    backends       = list(object({ ip_address = string, port = number }))
    health_checker = object({
      protocol    = string
      url_path    = string
      port       = number
      retries    = number
      timeout_in_seconds = number
    })
  }))
}

