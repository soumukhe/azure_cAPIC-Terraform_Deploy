#!/bin/bash
# Decomission cAPIC resource group. 
# Deleted resource cannot be restored. Be careful.

#subscription for Azure Account
subs="your_Azure_Subscription_Id"
resourceGroup="2502"
location="eastus"
deploymentName="2502"

# Set Default Azure Subs
az account set -s $subs

# Delete resource group and location without confirmation asked.
az group delete --resource-group $resourceGroup --yes

printf "cAPIC deployment is deleted."
