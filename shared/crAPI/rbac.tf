resource "kubernetes_cluster_role" "crapi-role" {
  depends_on  = [kubernetes_namespace.crapi]

    metadata {
      name = "crapi-waitfor-reader"
    }
    rule {
      api_groups = [""]
      resources = ["services","pods"]
      verbs = ["get", "watch", "list"]
    } 
}
resource "kubernetes_role_binding_v1" "crapi-role-binding" {
  depends_on  = [kubernetes_namespace.crapi]

    metadata {
      name = "crapi-waitfor-grant"
    }
    role_ref {
      api_group = "rbac.authorization.k8s.io"
      kind      = "ClusterRole"
      name      = "crapi-waitfor-reader"
    }
    subject {
        kind      = "ServiceAccount"
        name      = "default"
        namespace = "crapi"
        api_group = ""
    }
}
