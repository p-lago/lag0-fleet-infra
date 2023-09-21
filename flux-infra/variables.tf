variable "github_owner" {
  type = string
  default = "antoniolago"
}

variable "github_token" {
  type = string
}

variable "repository_name" {
  type    = string
  default = "free-k8s-oci-tf"
}

variable "repository_visibility" {
  type    = string
  default = "public"
}

variable "branch" {
  type    = string
  default = "master"
}

variable "target_path" {
  type    = string
  default = "free-k8s-cluster"
}
