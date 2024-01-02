# Namespace Management

This module creates namespaces from a map and uses rolebindings to manage permissions. The permissions.admins and
permissions.devs lists should contain names of existing groups.

## Examples

[Complete Example](./examples/complete/main.tf)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.24.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_namespace"></a> [namespace](#module\_namespace) | ./modules/namespace | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | A map of namespaces with their metadata and permissions. | <pre>map(object({<br>    labels = map(string)<br>    permissions = list(object({<br>      role_ref = object({<br>        kind      = string<br>        name      = string<br>        api_group = string<br>      })<br>      subjects = list(object({<br>        kind      = string<br>        name      = string<br>        api_group = string<br>      }))<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

