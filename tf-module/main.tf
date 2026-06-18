terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0" # Lock version to 2.x
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "helm" {}
provider "kubernetes" {}
provider "google" {
  project = var.project_id
}

resource "helm_release" "activemq" {
  provider   = helm.app  # <-- Explicitly bind GKE launcher provider
  name       = var.deployment_name
  repository = var.helm_chart_repo
  chart      = var.helm_chart_name
  version    = var.helm_chart_version
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
  
  