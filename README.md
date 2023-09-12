# Namespace Management

This module creates namespaces from a map and uses rolebindings to manage permissions. The permissions.admins and
permissions.devs lists should contain names of existing groups.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/resources/namespace_v1) | resource |
| [kubernetes_role_binding.admins](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/resources/role_binding) | resource |
| [kubernetes_role_binding.devs](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/resources/role_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | A map of namespaces with their metadata and permissions. | <pre>map(object({<br>    labels = map(string)<br>    permissions = object({<br>      admins = list(string)<br>      devs   = list(string)<br>    })<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

