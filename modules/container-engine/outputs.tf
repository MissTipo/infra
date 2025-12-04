output "cluster_id" {
  value = oci_containerengine_cluster.cluster.id
  description = "The OCID of the created OKE cluster"
}

# Kubeconfig content
data "oci_containerengine_cluster_kube_config" "this" {
  cluster_id    = oci_containerengine_cluster.cluster.id
  token_version = "2.0.0"
  # endpoint = "PUBLIC_ENDPOINT" # optional, defaults to public
}

output "kubeconfig" {
  value = data.oci_containerengine_cluster_kube_config.this.content
  description = "Kubeconfig YAML for the created OKE cluster"
}

# Node pool info (labels and optionally taints)
output "node_labels" {
  value       = { for np in [oci_containerengine_node_pool.nodepool] : np.id => np.initial_node_labels }
  description = "Initial labels assigned to each node pool"
}

