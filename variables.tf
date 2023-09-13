variable "namespaces" {
  type = map(object({
    labels = map(string)
    permissions = list(object({
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
  }))
  description = "A map of namespaces with their metadata and permissions."
}
