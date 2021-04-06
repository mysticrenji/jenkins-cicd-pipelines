module "azureappservice-dev" {
  source             = "../../azure-app-service"
  location           = "UK South"
  appservicename       = "terraform-appsvcname"

}