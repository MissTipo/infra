output "cluster_id" {
  value = oci_containerengine_cluster.cluster.id
}

# Use data source to fetch kubeconfig after cluster is created
data "oci_containerengine_cluster_kube_config" "this" {
  cluster_id    = oci_containerengine_cluster.cluster.id
  token_version = "2.0.0"
  # endpoint = "PUBLIC_ENDPOINT" # optional, defaults to public
}

output "kubeconfig" {
  value = data.oci_containerengine_cluster_kube_config.this.content
  description = "Kubeconfig YAML for the created OKE cluster"
}

