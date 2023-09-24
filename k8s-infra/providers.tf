terraform {
  required_providers {
    k8s = {
      source = "metio/k8s"
      version = "2023.9.4"
    }
    oci = {
      source = "oracle/oci"
      version = "5.13.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.11.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

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