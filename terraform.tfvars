# Please populate these values based on your reqirements.  
# Be careful of "externalSubnets" 0.0.0.0/0 will open this up to all.  You may want to change this.
# The value assigned to variable _artifactsLocation below is for cAPIC 25.0.2.  To get values for other versions
# Please read https://unofficialaciguide.com
#
#
vmName                   = "CloudAPIC"
rgName                   = "capic2502"
location                 = "eastus"
vmSize                   = "Standard_D8s_v3"
imageSku                 = "25_0_2-byol"
imageVersion             = "latest"
adminUsername            = "capicuser"
fabricName               = "ACI-Cloud-Fabric"
infraVNETPool            = "10.10.0.0/24"
externalSubnets          = "0.0.0.0/0"            # careful here !
publicIpDns              = "cloudapic-f8749d40cd" # can generate a random suffix with --> echo $RANDOM | md5sum | head -c 10; echo;
publicIPName             = "CloudAPIC-pip"
publicIPSku              = "Standard"
publicIPAllocationMethod = "Static"
publicIPNewOrExisting    = "new"
publicIPResourceGroup    = "capic2502"
virtualNetworkName       = "overlay-1"
mgmtNsgName              = "controllers_cloudapp-cloud-infra"
mgmtAsgName              = "controllers_cloudapp-cloud-infra"
subnetPrefix             = "subnet-"
_artifactsLocation       = "https://catalogartifact.azureedge.net/publicartifacts/cisco.cisco-aci-cloud-apic-8daf35dd-b9ee-4fd4-9235-74bc41ddc901-25_0_2-byol/Artifacts/mainTemplate.json"
adminPasswordOrKey       = "mySekretPassword123!"               # this is the value for cAPC password
adminPublicKey           = "Enter_the_Value_of_Public_KEY_Here" # Generate key pair with ssh-keygen



