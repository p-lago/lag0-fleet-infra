terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "5.13.0"
    }
  }
  backend "http" {
    address = var.object_storage_uri
    update_method = "PUT"
  }
}