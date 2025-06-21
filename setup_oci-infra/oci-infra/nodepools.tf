data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

locals {
  # Gather a list of availability domains for use in configuring placement_configs
  ads = data.oci_identity_availability_domains.ads.availability_domains[*].name
}

data "oci_core_images" "latest_arm64_image" {
  compartment_id = var.compartment_id
  operating_system = "Oracle Linux"
  operating_system_version = "7.9"
  filter {
    # Sample name: Oracle-Linux-7.9-2022.04.04-0
    name   = "display_name"
    values = ["^.*-aarch64-.*$"]
    regex = true
  }
}

resource "oci_containerengine_node_pool" "k8s_arm_node_pool" {
  cluster_id         = oci_containerengine_cluster.k8s_cluster.id
  compartment_id     = var.compartment_id
  kubernetes_version = "v1.33.1"
  name               = "k8s-arm_node-pool"
  node_config_details {
    dynamic placement_configs {
      for_each = local.ads
      content {
        availability_domain = placement_configs.value
        subnet_id           = oci_core_subnet.vcn_private_subnet.id
      }
    }
    size = 1
  }
  node_shape = "VM.Standard.A1.Flex"

  node_shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }

  node_source_details {
    image_id    = data.oci_core_images.latest_arm64_image.images.0.id
    source_type = "image"
  }

  initial_node_labels {
    key   = "name"
    value = "lag0-cluster"
  }
}

# data "oci_core_images" "latest_amd64_image" {
#   compartment_id = var.compartment_id
#   operating_system = "Oracle Linux"
#   operating_system_version = "7.9"
#   filter {
#     # Sample name: Oracle-Linux-7.9-2022.04.04-0
#     name   = "display_name"
#     values = ["^.*-7.9-2023.*$"]
#     regex = true
#   }
# }

# resource "oci_containerengine_node_pool" "k8s_amd_node_pool" {
#   cluster_id         = oci_containerengine_cluster.k8s_cluster.id
#   compartment_id     = var.compartment_id
#   kubernetes_version = "v1.33.1"
#   name               = "k8s-amd-node-pool"
#   node_config_details {
#     dynamic placement_configs {
#       for_each = local.ads
#       content {
#         availability_domain = placement_configs.value
#         subnet_id           = oci_core_subnet.vcn_private_subnet.id
#       }
#     }
#     size = 0
#   }
#   node_shape = "VM.Standard.E2.1.Micro"

#   node_shape_config {
#     memory_in_gbs = 1
#     ocpus         = 0.125
#   }

#   node_source_details {
#     image_id    = data.oci_core_images.latest_amd64_image.images.0.id
#     source_type = "image"
#   }

#   initial_node_labels {
#     key   = "name"
#     value = "free-k8s-cluster"
#   }
  
# }
