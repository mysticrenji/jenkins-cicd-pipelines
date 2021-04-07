module "azureappservice-dev" {
  source             = "../../azure-app-service"
  location           = "UK South"
  appservicename     = "terraform-appsvcname"
  dockerserverpassword = var.dockerserverpassword
  dockerusername = var.dockerusername
  dockerregistry = var.dockerregistry
}