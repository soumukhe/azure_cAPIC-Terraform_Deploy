
# The values here are confidential.  If you upload your code to git,  pleae include override.tf in .gitignore
# You can also create environment variables instead of putting them in this file.

variable "subscription_id" { default = "your_Azure_Subs_ID, az account show will show it" }
variable "client_id" { default = "the app_Id of the Service Prinipal" }
variable "client_secret" { default = "password for the Service Principal" }
variable "tenant_id" { default = "your_Azure_tenant_ID" }
