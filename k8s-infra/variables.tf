variable "compartment_id" {
  type        = string
  description = "The compartment to create the resources in"
}

variable "region" {
  type        = string
  description = "The region to provision the resources in"
}
variable "user_ocid" {
  type        = string
  description = "The user's OCID"
}
variable "fingerprint" {
  type        = string
  description = "API key's fingerprint"
}
variable "private_key" {
  type        = string
  description = "The PEM private key"
}

variable "public_subnet_id" {
  type = string
  description = "The public subnet's OCID"
}

variable "arm_node_pool_id" {
  type = string
  description = "The OCID of the Node Pools where the (free) ARM64 compute instances reside"
}

# variable "amd_node_pool_id" {
#   type = string
#   description = "The OCID of the Node Pool where the (non-free) AMD64 compute instances reside"
# }