#!/bin/bash
# Simple shell script to deploy Cisco cAPIC on Azure.
# Requirements:
# python installed
# azure cli 2.6 installed
# change value in parameters.json file to match your environment.
# change resourceGroup and location to match your environment.

res1=$(date +%s)
sleep 1 

#subscription account
subs="your_AZ_Subscription_Account_Id"
resourceGroup="2502"
location="eastus"
deploymentName="2502"

# Set Default Azure Subs
az account set -s $subs

# Create resource group and location
az group create -n $resourceGroup -l $location

# Deploy Azure cAPIC
az deployment group create --name $deploymentName  \
--resource-group $resourceGroup \
--template-file template/template.json \
--parameters template/parameters.json \
--subscription $subs 

# Optional script for measuring time to deploy cAPIC
# Time calculation (optional)
res2=$(date +%s)
echo "Start time: $res1"
echo "Stop time:  $res2"
echo "Elapsed:    $(echo "$res2 - $res1"|bc )"
seconds=$(echo "$res2 - $res1"|bc )

printf "==============================================================================\n"
function running_time {
PYTHON_ARG="$1" python - <<END
import os
seconds = float(os.environ['PYTHON_ARG'])
seconds = seconds % (24 * 3600) 
hour = seconds // 3600
seconds %= 3600
minutes = seconds // 60
seconds %= 60
print hour, "hours", minutes, "minutes", seconds, "seconds"
END
}
# Call it running time function
printf "cAPIC deployment time is:\n, Please wait few more mins.\n"
running_time $seconds
printf "Please wait few more minutes before reaching cAPIC GUI.\n"
