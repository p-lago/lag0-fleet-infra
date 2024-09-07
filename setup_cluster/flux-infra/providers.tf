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
provider "flux" {
  kubernetes = {
    config_path = "~/.kube/free-k8s-config"
  }
  git = {
    url  = "ssh://git@github.com/antoniolago/free-k8s-oci-tf.git"
    branch = var.branch
    ssh = {
      username    = "git"
      private_key = tls_private_key.this.private_key_pem
    }
  }
}


provider "github" {
  owner = var.github_owner
  token = var.github_token
}
