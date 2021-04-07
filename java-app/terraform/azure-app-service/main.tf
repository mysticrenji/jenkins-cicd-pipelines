resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_user_assigned_identity" "useridentity" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name = var.useridentity
}

# Create an App Service Plan with Linux
resource "azurerm_app_service_plan" "appserviceplan" {
  name                =  "${azurerm_resource_group.rg.name}-dockerapp"
  location            =  azurerm_resource_group.rg.location
  resource_group_name =  azurerm_resource_group.rg.name

  # Define Linux as Host OS
  kind = "Linux"
  reserved = true 
  # Choose size
  sku {
    tier = "Standard"
    size = "S1"
  }

  #properties {
  #  reserved = true # Mandatory for Linux plans
  #}
}

# Create an Azure Web App for Containers in that App Service Plan
resource "azurerm_app_service" "dockerapp" {
  name                = "${azurerm_resource_group.rg.name}-dockerapp"
  location            =  azurerm_resource_group.rg.location
  resource_group_name =  azurerm_resource_group.rg.name
  app_service_plan_id = "${azurerm_app_service_plan.appserviceplan.id}"

  # Do not attach Storage by default
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false

    
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = var.dockerregistry
    DOCKER_REGISTRY_SERVER_USERNAME = var.dockerusername
    DOCKER_REGISTRY_SERVER_PASSWORD = var.dockerserverpassword
    
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|ghcr.io/mysticrenji/spring-boot:v1"
    always_on        = "true"
  }

  identity {
    type = "SystemAssigned"
  }
}