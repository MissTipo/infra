include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/load-balancer/"
}

inputs = {
  environment      = "dev"
  compartment_ocid = get_env("OCI_COMPARTMENT_OCID")
  vcn_id           = get_env("OCI_VCN_OCID")
  subnet_ids       = [get_env("OCI_NODE_SUBNET_OCID")]
  lb_name          = "prod-api-lb"
  shape            = "100Mbps"
  is_private       = true

  backend_ip  = "10.0.1.192"
  backend_port = 8080

  listener_name = "http-listener"
  listener_port = 80

  backend_set_name = "backend-set-api"

  listeners = [
    {
      name     = "http-listener"
      protocol = "HTTP"
      port     = 80
    },
    {
      name     = "https-listener"
      protocol = "HTTPS"
      port     = 443
    }
  ]

  backend_sets = [
    {
      name   = "backend-set-api"
      policy = "ROUND_ROBIN"
      backends = [
        { ip_address = "10.0.1.192", port = 8080 }
      ]
      health_checker = {
        protocol = "HTTP"
        url_path = "/health"
        port = 8080
        retries = 3
        timeout_in_seconds = 5
      }
    }
  ]
}

