provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = ""
}

module "namespace" {
  source = "../../"

  namespaces = {
    foo = {
      labels = {}
      permissions = []
    }
    example = {
      labels = {
        key = "value"
      }
      permissions = [
        {
          role_ref = {
            kind      = "Role"
            name      = "namespace-viewer"
            api_group = "rbac.authorization.k8s.io"
          }
          subjects = [
            {
              kind      = "Group"
              name      = "example"
              api_group = "rbac.authorization.k8s.io"
            },
            {
              kind      = "Group"
              name      = "example2"
              api_group = "rbac.authorization.k8s.io"
            }
          ]
        },
        {
          role_ref = {
            kind      = "Role"
            name      = "namespace-admin"
            api_group = "rbac.authorization.k8s.io"
          }
          subjects = [
            {
              kind      = "Group"
              name      = "example3"
              api_group = "rbac.authorization.k8s.io"
            },
            {
              kind      = "Group"
              name      = "example4"
              api_group = "rbac.authorization.k8s.io"
            }
          ]
        }
      ]
    }
  }
}
