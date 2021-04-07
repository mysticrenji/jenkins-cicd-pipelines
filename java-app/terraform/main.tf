provider "azurerm" {
    features {}
}

provider "azuread" {
}

module "azureappservice-dev" {
  source = "./environments/dev"
  dockerregistry = var.dockerregistry
  dockerusername = var.dockerusername
  dockerserverpassword = var.dockerserverpassword
}