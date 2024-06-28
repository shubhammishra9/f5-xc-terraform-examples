resource "kubernetes_secret" "jwks-secret" {
  depends_on  = [kubernetes_namespace.crapi]

    metadata {
        name = "jwt-key-secret"
    }
    
    type = "kubernetes.io/generic"

    data = {
        "jwks.json" = base64encode(var.json_input)
    }
}

resource "kubernetes_namespace" "crapi" {
  metadata {
    name = "crapi"
  }
}