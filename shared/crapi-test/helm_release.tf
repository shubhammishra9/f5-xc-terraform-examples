resource "helm_release" "crapi" {
  name       = "crapi"
  chart      = "./helm"

  values = [
    file("./helm/values.yaml")
  ]
}