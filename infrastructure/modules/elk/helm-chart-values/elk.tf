resource "kubernetes_namespace" "elk_ns" {
  metadata {
    name = "elk"
  }
}

resource "helm_release" "elasticsearch" {
  chart      = "elasticsearch"
  name       = "elasticsearch"
  namespace  = "elk"
  repository = "https://helm.elastic.co"
  version    = "8.5.1"
  values = [
    files("${path.module}/helm-chart-values/elasticsearch.yaml")
  ]
}

resource "helm_release" "kibana" {
  chart      = "kibana"
  name       = "kibana"
  namespace  = "elk"
  repository = "https://charts.bitnami.com/bitnami"
  version    = "11.4.4"
  values = [
    files("${path.module}/helm-chart-values/kibana.yaml")
  ]
}

resource "helm_release" "logstash" {
  chart      = "logstash"
  name       = "logstash"
  namespace  = "elk"
  repository = "https://helm.elastic.co"
  version    = "8.5.1"
  values = [
    files("${path.module}/helm-chart-values/logstash.yaml")
  ]
}
