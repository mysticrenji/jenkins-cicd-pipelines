provider "azurerm" {
    features {}
}

module "azurestatic-dev" {
  source = "./environments/dev"
}