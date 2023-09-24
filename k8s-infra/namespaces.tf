resource "kubernetes_namespace" "free_namespace" {
  metadata {
    name = "free-ns"
    labels = {
      "registry_auth" = "true"
    }
  }
}
