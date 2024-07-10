provider "kubernetes" {
  config_path    = pathexpand("/tmp/config")
  config_context = "kind-cluster"
}

provider "helm" {
  kubernetes {
    config_path = pathexpand("/tmp/config")
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  depends_on = [kubernetes_namespace.argocd]
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  name       = "argocd"
  namespace  = "argocd"

  values = [file("values/argocd.yaml")]
}