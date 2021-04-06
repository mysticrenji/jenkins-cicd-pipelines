provider "azurerm" {
    features {}
}

provider "azuread" {
}

module "azureappservice-dev" {
  source = "./environments/dev"
}