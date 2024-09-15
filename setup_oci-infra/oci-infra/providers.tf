provider "oci" {
  region = var.region
  private_key_path = var.ssh_private_key_path
  # private_key_password = var.ssh_private_key_password
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  tenancy_ocid = var.tenancy_ocid
}