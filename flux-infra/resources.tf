resource "tls_private_key" "this" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

# resource "github_repository" "this" {
#   name       = var.repository_name
#   visibility = var.repository_visibility
#   # auto_init  = true
# }

resource "github_branch_default" "this" {
  repository = "free-k8s-oci-tf"
  branch     = var.branch
}

resource "github_repository_deploy_key" "this" {
  title      = "free-k8s-cluster"
  repository = "free-k8s-oci-tf"
  key        = tls_private_key.this.public_key_openssh
  read_only  = false
}

resource "flux_bootstrap_git" "this" {
  depends_on = [github_repository_deploy_key.this]
  path = "free-k8s-cluster"
}