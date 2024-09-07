# resource "k8s_external_secrets_io_cluster_secret_store_v1alpha1" "minimal" {
#   metadata = {
#     name = "vault-pessoal-store"
#   }
#   spec = {
#     provider = {
#       oracle = {
#         region = var.region
#         vault  = "Pessoal"
#       }
#       auth = {
#         secret_ref = {
#           fingerprint = {
#             key = "vault-fingerprint"
#             name = ".dockerconfigjson"
#           }
#           privateKey = {
#             key = "RadarVoluntario"
#             name = ".dockerconfigjson"
#           }
#         }
#         tenancy = "antoniolago"
#         user = var.user_ocid
#       }
#     }
#   }
# }
# resource "k8s_external_secrets_io_cluster_external_secret_v1beta1" "minimal" {
#   metadata = {
#     name = "vault-pessoal-external-secret"
#   }
#   spec = {
#     namespace_selector = {
#       matchLabels = ["vault.external.secret", "true"]
#     }
#     external_secret_spec = {
#       data = [ {
#         remote_ref = { key = ".dockerconfigjson" }
#         secret_key = ".dockerconfigjson"
#       } ]
#     }
#   }
# }
