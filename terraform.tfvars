# Please populate these values based on your reqirements.  
# Be careful of "externalSubnets" 0.0.0.0/0 will open this up to all.  You may want to change this.
# The value assigned to variable _artifactsLocation below is for cAPIC 25.0.2.  To get values for other versions
# Please read https://unofficialaciguide.com
#
#
vmName   = "CloudAPIC"
rgName   = "capic2502"
location = "eastus"
vmSize = "Standard_D8s_v3"
imageSku = "25_0_2-byol"
imageVersion = "latest"
adminUsername = "capicuser"
fabricName = "ACI-Cloud-Fabric"
infraVNETPool = "10.10.0.0/24"
externalSubnets = "0.0.0.0/0"
publicIpDns =   "cloudapic-f8749d40cd" # can generate a random suffix with --> echo $RANDOM | md5sum | head -c 10; echo;
publicIPName = "CloudAPIC-pip"
publicIPSku = "Standard"
publicIPAllocationMethod = "Static"
publicIPNewOrExisting = "new"
publicIPResourceGroup = "capic2502"
virtualNetworkName = "overlay-1"
mgmtNsgName = "controllers_cloudapp-cloud-infra" 
mgmtAsgName = "controllers_cloudapp-cloud-infra"
subnetPrefix = "subnet-"
_artifactsLocation = "https://catalogartifact.azureedge.net/publicartifacts/cisco.cisco-aci-cloud-apic-8daf35dd-b9ee-4fd4-9235-74bc41ddc901-25_0_2-byol/Artifacts/mainTemplate.json"
adminPasswordOrKey = "123Cisco123!"
adminPublicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEn0nLxGBEmELuiN1hPVs5DoB9wQyAzdB8+JD8izfQMjLx5GWq2QlM5ARi9mkXzSbYXoJfrQLNWU7deknbpP+Qd5O0ieUmPUbBvxPfpmIY2B1Y33GYs9laKrVFnl0U/CrAtYvL4M67eV40jGK8HyGrd9ZlMcXSmIXjqMb57ydPOvY9DGjLAjNnxmPkRqtBjom7VpKyqwWYtoAkU6tm191V+ez1YfvPgilj+hk/nSMsYzeI2yzuQOyUA3tnvrJXQ913yeLCF0LznxZCgBn6WpmF5ZuNgBU61yBkHrkzW4BN2L1ornn9yPW98QZ8C7+2+x65w0aiYamZwM5rTSs732uJ"   # Generate key pair with ssh-keygen



