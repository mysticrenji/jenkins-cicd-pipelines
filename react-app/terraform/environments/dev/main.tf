module "azurestatic-dev" {
  source             = "../../azure-static-apps"
  location           = "UK South"
  product            = "staticappsdev"
  storagename         = "staticapps30032021"
}