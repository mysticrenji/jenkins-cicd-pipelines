provider "azurerm" {
    features {}
}

provider "azuread" {
}

module "azureappservice-dev" {
  source = "./environments/dev"
  dockerserverpassword = var.dockerserverpassword
  dockerusername = var.dockerusername
  dockerregistry = var.dockerregistry  
}