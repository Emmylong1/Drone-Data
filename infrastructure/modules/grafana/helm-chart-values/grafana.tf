resource "kubernetes_namespace" "grafana_ns" {
    metadata {
      name = "grafana"
    }
  
}


resource "helm_release" "grafana" {
    chart      = "grafana-operator"
    name       = "grafana-operator"
    namespace  = "grafana"
    repository = "https://charts.bitnami.com/bitnami"
    version    = "4.9.6"
    values = [
        files("${path.module}/helm-chart-values/ingress.yaml")
        ]
}

