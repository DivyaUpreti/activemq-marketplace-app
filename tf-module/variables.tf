variable "project_id" {
  type        = string
  description = "The Google Cloud Project ID"
}
  
variable "helm_chart_repo" {
  type        = string
  default     = "oci://us-docker.pkg.dev/cloud-marketplace-ops-test/activemq"
  description = "OCI repository for the Helm chart"
}
  
variable "deployment_name" {
  type = string
}
  
variable "namespace" {
  type = string
}
  
variable "image_repo" {
  type = string
}
  
variable "image_tag" {
  type = string
}
  
variable "persistence_storage_class" {
  type = string
}
  
variable "admin_bind_all_hosts" { 
  type    = bool 
  default = true
}
  
variable "persistence_size" {
  type    = string
  default = "20Gi"
}
  
variable "console_password" {
  type      = string
  sensitive = true
}
  
variable "helm_chart_version" {
  type        = string
  description = "The version of the Helm chart to deploy."
}
  
variable "helm_chart_name" {
  type        = string
  description = "The name of the Helm chart to deploy."
}

#GKE Cluster variables
variable "cluster_name" {
  type        = string
  description = "The name of the GKE cluster."
}
  
variable "cluster_location" {
  type        = string
  description = "The region or zone of the GKE cluster."
}
  
variable "network_name" {
  type    = string
  default = "default"
}
  
variable "subnetwork_name" {
  type    = string
  default = "default"
}