variable resource_group_name {
  default = "terraform-azure-appsvc"
}

variable location {
  default = "West Europe"
}

variable useridentity {
  default = "staticapps"
}

variable appservicename {
  default = "terraform-appsvcname"
}

variable dockerregistry {
  description = "dockerregistry"
  type        = string
}

variable dockerusername {
  description = "dockerusername"
  type        = string
}

variable dockerserverpassword {
  description = "dockerserverpassword"
  type        = string
}
