resource "kubernetes_namespace_v1" "this" {
  metadata {
    name   = var.namespace
    labels = var.labels
  }
}

resource "kubernetes_role_binding" "this" {
  for_each = { for idx, value in var.permissions : idx => value }
  metadata {
    name      = each.value.role_ref.name
    namespace = var.namespace
  }
  role_ref {
    kind      = each.value.role_ref.kind
    name      = each.value.role_ref.name
    api_group = each.value.role_ref.api_group
  }
  dynamic "subject" {
    for_each = { for idx, value in each.value.subjects : idx => value }
    content {
      kind      = subject.value.kind
      name      = subject.value.name
      api_group = subject.value.api_group
    }
  }
}

