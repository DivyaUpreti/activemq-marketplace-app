variable "deployment_name" { type = string }
variable "namespace"       { type = string }
variable "image_repo"      { type = string }
variable "image_tag"       { type = string }
variable "persistence_storage_class" { type = string }
variable "admin_bind_all_hosts" { type = bool }
variable "persistence_size" {
  type    = string
  default = "20Gi"
}
variable "console_password" {
  type      = string
  sensitive = true
}