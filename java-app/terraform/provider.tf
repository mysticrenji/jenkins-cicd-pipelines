terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

     azuread = {
      source  = "hashicorp/azuread"
      version = "3.5.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-experiments-sea"
    storage_account_name  = "terraformblobstoragedev"
    container_name        = "terraform"
    key                   = "jenkins-java-bucket.tfstate"
  }
}