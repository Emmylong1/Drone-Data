resource "kubernetes_namespace" "argocd_ns" {
    metadata {
      name = "argocd"
    }
  
}


resource "helm_release" "argocd" {
    chart      = "argo-cd"
    name       = "argocd"
    namespace  = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    version    = "7.8.0"
    values = [
        files("${path.module}/helm-chart-values/argocd.yaml")
        ]
    depends_on = [ kubernetes_namespace.argocd_ns ]
}

