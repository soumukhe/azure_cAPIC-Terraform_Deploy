# Please run the following 2 commands before doing a Terraform apply
# subs=<yourAzureSubscriptionID>
# terraform import azurerm_marketplace_agreement.c8kv /subscriptions/$subs/providers/Microsoft.MarketplaceOrdering/agreements/cisco/offers/cisco-c8000v/plans/17_07_01a-byol

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.1.0"
    }
  }
}

# Provider in subscription
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
    template_deployment {
      delete_nested_items_during_deletion = false
    }
  }
}


# If not Subscribed to Clour Routers Catalyst-Edge-8000v, then subscribe to it
resource "azurerm_marketplace_agreement" "c8kv" {
  publisher = "cisco"
  offer     = "cisco-c8000v"
  plan      = try("17_07_01a-byol")
}


# Deploy a resource group
resource "azurerm_resource_group" "rgroup" {
  name     = var.rgName
  location = var.location
}


# Deploy cAPIC from ARM template
resource "azurerm_resource_group_template_deployment" "capic" {
  depends_on          = [azurerm_resource_group.rgroup]
  name                = var.vmName
  resource_group_name = var.rgName
  deployment_mode     = "Incremental"
  template_content    = file("template/template.json")
  parameters_content = jsonencode({
    adminPasswordOrKey       = { value = var.adminPasswordOrKey }
    adminPublicKey           = { value = var.adminPublicKey }
    location                 = { value = var.location }
    vmName                   = { value = var.vmName }
    vmSize                   = { value = var.vmSize }
    imageSku                 = { value = var.imageSku }
    imageVersion             = { value = var.imageVersion }
    adminUsername            = { value = var.adminUsername }
    fabricName               = { value = var.fabricName }
    infraVNETPool            = { value = var.infraVNETPool }
    externalSubnets          = { value = var.externalSubnets }
    publicIpDns              = { value = var.publicIpDns }
    publicIPName             = { value = var.publicIPName }
    publicIPSku              = { value = var.publicIPSku }
    publicIPAllocationMethod = { value = var.publicIPAllocationMethod }
    publicIPNewOrExisting    = { value = var.publicIPNewOrExisting }
    publicIPResourceGroup    = { value = var.publicIPResourceGroup }
    virtualNetworkName       = { value = var.virtualNetworkName }
    mgmtNsgName              = { value = var.mgmtNsgName }
    mgmtAsgName              = { value = var.mgmtAsgName }
    subnetPrefix             = { value = var.subnetPrefix }
    _artifactsLocation       = { value = var._artifactsLocation }

  })

}

# Azure subscription
data "azurerm_subscription" "primary" {
}

data "azurerm_virtual_machine" "capic" {
  depends_on          = [azurerm_resource_group_template_deployment.capic]
  name                = var.vmName
  resource_group_name = azurerm_resource_group.rgroup.name
}

# Assign contributor role
resource "azurerm_role_assignment" "capic" {
  depends_on           = [azurerm_resource_group_template_deployment.capic]
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_virtual_machine.capic.identity.0.principal_id
}
