provider "azurerm" {
    version = "~>2.0"
    features {}
}

module "azurestatic-dev" {
  source = "environments/dev"
}