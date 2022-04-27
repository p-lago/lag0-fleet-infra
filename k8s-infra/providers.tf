provider "oci" {
  region = var.region
}

provider "kubernetes" {
  config_path = "~/.kube/free-k8s-config"
}

provider "helm" {
  kubernetes {
  config_path = "~/.kube/free-k8s-config"
  }
}
