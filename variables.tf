variable "namespaces" {
  type = map(object({
    labels = map(string)
    permissions = object({
      admins = list(string)
      devs   = list(string)
    })
  }))
  description = "A map of namespaces with their metadata and permissions."
}
