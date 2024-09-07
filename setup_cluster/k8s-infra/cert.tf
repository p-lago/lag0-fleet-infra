# module "cert_manager" {
#   source        = "terraform-iaac/cert-manager/kubernetes"

#   cluster_issuer_email                   = "antonio.clago@outlook.com"
#   cluster_issuer_name                    = "cert-manager-global"
#   cluster_issuer_private_key_secret_name = "cert-manager-private-key"
#   # additional_sets = extraArgs={--dns01-recursive-nameservers=8.8.8.8:53\,1.1.1.1:53}
#   # certificates = {
#   #   "radar-voluntario-dev-certificate" = {
#   #     dns_names = ["radarvoluntario.duckdns.org"]
#   #   }
#   # }
# }