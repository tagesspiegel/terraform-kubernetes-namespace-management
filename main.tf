resource "kubernetes_namespace_v1" "this" {
  for_each = var.namespaces
  metadata {
    name   = each.key
    labels = each.value.labels
  }
}

resource "kubernetes_role_binding" "devs" {
  for_each = { for key, value in var.namespaces : key => value if length(value.permissions.devs) > 0 }
  metadata {
    name      = "developers"
    namespace = each.key
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "namespace-viewer"
  }
  dynamic "subject" {
    for_each = each.value.permissions.devs
    content {
      kind      = "Group"
      name      = subject.value
      api_group = "rbac.authorization.k8s.io"
    }
  }
}

resource "kubernetes_role_binding" "admins" {
  for_each = { for key, value in var.namespaces : key => value if length(value.permissions.admins) > 0 }
  metadata {
    name      = "admins"
    namespace = each.key
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "namespace-admins"
  }
  dynamic "subject" {
    for_each = each.value.permissions.admins
    content {
      kind      = "Group"
      name      = subject.value
      api_group = "rbac.authorization.k8s.io"
    }
  }
}
