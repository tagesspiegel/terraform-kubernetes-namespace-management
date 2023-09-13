variable "namespace" {
  type        = string
  description = "The name of the namespace to be created."
}

variable "labels" {
  type        = map(string)
  description = "The labels that should be attached to the namespace."
}

variable "permissions" {
  type = list(object({
    role_ref = object({
      kind      = string
      name      = string
      api_group = string
    })
    subjects = list(object({
      kind      = string
      name      = string
      api_group = string
    }))
  }))
  description = "The list of rbac permissions to be created."
}
