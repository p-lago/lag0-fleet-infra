data "oci_containerengine_node_pool" "k8s_arm_np" {
  node_pool_id = var.arm_node_pool_id
}

# data "oci_containerengine_node_pool" "k8s_amd_np" {
#   node_pool_id = var.amd_node_pool_id
# }

locals {
  active_nodes = [for node in data.oci_containerengine_node_pool.k8s_arm_np.nodes : node if node.state == "ACTIVE"]
  # active_arm_nodes = [for node in data.oci_containerengine_node_pool.k8s_arm_np.nodes : node if node.state == "ACTIVE"]
  # active_amd_nodes = [for node in data.oci_containerengine_node_pool.k8s_amd_np.nodes : node if node.state == "ACTIVE"]
  # active_nodes = merge(active_arm_nodes, active_amd_nodes)
}

resource "oci_network_load_balancer_network_load_balancer" "free_nlb" {
  compartment_id = var.compartment_id
  display_name   = "free-k8s-nlb"
  subnet_id      = var.public_subnet_id

  is_private                     = false
  is_preserve_source_destination = false
}

resource "oci_network_load_balancer_backend_set" "free_nlb_backend_set" {
  health_checker {
    protocol = "TCP"
    port     = 10256
  }
  name                     = "free-k8s-backend-set"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  policy                   = "FIVE_TUPLE"

  is_preserve_source = false
}

resource "oci_network_load_balancer_backend" "free_nlb_backend" {
  count                    = length(local.active_nodes)
  backend_set_name         = oci_network_load_balancer_backend_set.free_nlb_backend_set.name
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  port                     = 31600
  target_id                = local.active_nodes[count.index].id
}

resource "oci_network_load_balancer_listener" "free_nlb_listener" {
  default_backend_set_name = oci_network_load_balancer_backend_set.free_nlb_backend_set.name
  name                     = "free-k8s-nlb-listener"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  port                     = "80"
  protocol                 = "TCP"
}
