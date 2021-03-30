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
  backend "s3" {
    bucket = "terraform-bucket-jenkins"
    key    = "statefile/azure-static.tfstate"
    region = "us-west-2"
  }
}