#!/bin/bash
terraform state list | while read line
do
echo "deleting: " $line
terraform destroy -target $line -auto-approve
done
~                                                
