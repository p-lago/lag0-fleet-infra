terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "5.13.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.4"
    }
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.1.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}
