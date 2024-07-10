terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    /*helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }*/
  }
}

provider "kind" {}
/*provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "kind-cluster"
}*/