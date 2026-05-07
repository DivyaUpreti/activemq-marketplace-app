terraform {
  required_version = ">= 0.13"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "helm" {}
provider "kubernetes" {}

resource "helm_release" "activemq" {
  name       = var.deployment_name
  repository = "oci://us-docker.pkg.dev/cloud-marketplace-ops-test/gcr.io"
  chart      = "activemq"
  version    = "1.0.0"
  namespace  = var.namespace
  timeout    = 1800
 
  set {
    name  = "image.repository"
    value = var.image_repo
  }
  set {
    name  = "image.tag"
    value = var.image_tag
  }
  set {
    name  = "persistence.storageClass"
    value = var.persistence_storage_class
  }
  set {
    name  = "persistence.size"
    value = var.persistence_size
  }
  set {
    name  = "admin.bindAllHosts"
    value = var.admin_bind_all_hosts
  }
  set {
    name  = "consolePassword"
    value = var.console_password
  }
}