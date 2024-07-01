resource "kubernetes_namespace" "crapi-ns" {
  metadata {
    name = "crapi"
  }
}

resource "helm_release" "crapi" {
  depends_on  = [kubernetes_namespace.crapi-ns]
  name       = "crapi"
  chart      = "./helm"
  values = [
    file("./helm/values.yaml")
  ]
}