terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.53.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

     azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-experiments-sea"
    storage_account_name  = "terraformblobstoragedev"
    container_name        = "terraform"
    key                   = "jenkins-java-bucket.tfstate"
  }
}