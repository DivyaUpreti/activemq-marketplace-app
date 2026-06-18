locals {
  host           = "https://${google_container_cluster.primary.endpoint}"
  ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}
  
# Fetch Google registry access auth token
data "google_client_config" "default" {}
  
# Provider configuration linked to the created GKE cluster
provider "kubernetes" {
  alias                  = "app"
  host                   = local.host
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = local.ca_certificate
}
  
provider "helm" {
  alias = "app"
  kubernetes {
    host                   = local.host
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = local.ca_certificate
  }
}
  
# GKE Cluster definition (satisfies GCM Validator check)
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.cluster_location
  network            = var.network_name
  subnetwork         = var.subnetwork_name
  initial_node_count = 1
  
  # Optimal setting to override standard default nodes
  remove_default_node_pool = true
}
  
# Custom node pool definition
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.cluster_location
  cluster    = google_container_cluster.primary.name
  node_count = 1
  
  node_config {
    machine_type = "e2-standard-2"
  }
}
  
  