provider "aws" {
  region = "ap-south-1"
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "my-cluster"
  kubernetes_version = "1.33"

  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # EKS Provisioned Control Plane configuration
  control_plane_scaling_config = {
    tier = "tier-xl"
  }

  vpc_id     = "vpc-044df1cd6a350953b"
  subnet_ids = ["subnet-0c79a03ecad015f30", "subnet-017a686591fd8291b"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}