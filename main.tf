module "namespace" {
  source   = "./modules/namespace"
  for_each = var.namespaces

  namespace   = each.key
  labels      = each.value.labels
  permissions = each.value.permissions
}
