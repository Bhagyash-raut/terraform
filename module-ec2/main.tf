provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  instance_type = "t3.micro"
  key_name      = "batch"
  monitoring    = true
  subnet_id     = "sg-0037090ba6abbe8c1"
  user_data    = file("${path.module}/provision.sh")
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

