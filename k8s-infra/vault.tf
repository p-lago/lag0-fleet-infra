resource "k8s_external_secrets_io_secret_store_v1alpha1" "minimal" {
  metadata = {
    name = "vault-pessoal"
  }
  spec = {
    provider = {
        oracle = {
            region = var.region
            vault = "Pessoal"
        }
        auth = {
            secret_ref = {
                fingerprint = var.fingerprint
                privateKey = {
                    key = "RadarVoluntario"
                    name = ".dockerconfigjson"
                }
            }
            tenancy = "antoniolago"
            user = var.user_ocid
        }
    }
  }
}