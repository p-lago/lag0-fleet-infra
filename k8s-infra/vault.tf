resource "k8s_external_secrets_io_secret_store_v1alpha1" "minimal" {
  metadata = {
    name = "vault-pessoal"
  }
  spec = {
    provider = {
        oracle = {
            region = var.region
            vault = "vault-pessoal"
        }
        auth = {
            secret_ref = {
                fingerprint = var.fingerprint
                privateKey = var.ssh_private_key
            }
            tenancy = "antoniolago"
            user = var.user_ocid
        }
    }
  }
}