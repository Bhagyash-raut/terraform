# Replace these subnets with your own two subnet IDs in different Availability Zones
subnet_ids = [
  "subnet-08d9cdaacb10accae",
  "subnet-017a686591fd8291b"
]







#terraform apply -var='subnet_ids=["subnet-08d9cdaacb10accae","subnet-017a686591fd8291b"]'
#terraform apply -var-file="prod.tfvars"