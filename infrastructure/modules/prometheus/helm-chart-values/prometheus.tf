resource "kubernetes_namespace" "prometheus_ns" {
    metadata {
      name = "prometheus"
    }
  
}


resource "helm_release" "prometheus" {
    chart      = "prometheus"
    name       = "prometheus"
    namespace  = "prometheus"
    repository = "https://prometheus-community.github.io/helm-charts"
    version    = "27.3.0"
    values = [
        files("${path.module}/helm-chart-values/prometheus.yaml")
        ]
}

