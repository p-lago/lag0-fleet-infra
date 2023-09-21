provider "oci" {
  region = var.region
}

provider "kubernetes" {
  config_path = "~/.kube/free-k8s-config"
}
provider "kubectl" {
  config_path    = "~/.kube/free-k8s-config"
  config_context = "context-cma22fw2eca"
}
provider "helm" {
  kubernetes {
  config_path = "~/.kube/free-k8s-config"
  }
}