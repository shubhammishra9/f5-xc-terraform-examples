resource "helm_release" "crapi" {
  name       = "crapi-release"
  chart      = "./helm"

  values = [
    file("./helm/values.yaml")
  ]
}