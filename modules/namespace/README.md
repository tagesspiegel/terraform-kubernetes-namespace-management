<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.24.0/docs/resources/namespace_v1) | resource |
| [kubernetes_role_binding.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.24.0/docs/resources/role_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | The labels that should be attached to the namespace. | `map(string)` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The name of the namespace to be created. | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | The list of rbac permissions to be created. | <pre>list(object({<br>    role_ref = object({<br>      kind      = string<br>      name      = string<br>      api_group = string<br>    })<br>    subjects = list(object({<br>      kind      = string<br>      name      = string<br>      api_group = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->