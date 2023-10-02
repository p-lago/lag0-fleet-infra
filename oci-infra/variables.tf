variable "compartment_id" {
  type        = string
  description = "The compartment to create the resources in"
}

variable "region" {
  type        = string
  description = "The region to provision the resources in"
}

variable "ssh_public_key_path" {
  type        = string
  description = "The SSH public key path to use for connecting to the worker nodes"
}

variable "ssh_private_key_path" {
  type        = string
  description = "The SSH private key path to use for connecting to the worker nodes"
}

# variable "ssh_private_key_password" {
#   type        = string
#   description = "The SSH public key to use for connecting to the worker nodes"
# }
variable "fingerprint" {
  type        = string
  description = "Fingerprint can be found after registering your public key in API keys"
}
variable "user_ocid" {
  type        = string
  description = "User OCID"
}
variable "tenancy_ocid" {
  type        = string
  description = "Tenancy OCID"
}
variable "object_storage_uri" {
  type        = string
  description = "Object Storage pre authenticated request"
}