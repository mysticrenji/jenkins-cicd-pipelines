provider "azurerm" {
    features {}
}

provider "azuread" {
}

module "azurestatic-dev" {
  source = "./environments/dev"
}