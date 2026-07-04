provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./module-ec2-instance"

  ami_id                 = "ami-006f82a1d5a27da54"
  instance_type          = "t3.micro"
  key_name               = "batch"
  subnet_id              = "subnet-08d9cdaacb10accae"
  vpc_security_group_ids = ["sg-0037090ba6abbe8c1"]
  ssh_user               = "ubuntu"
  private_key_path       = "${path.module}/batch.pem"
  provisioner_commands   = [
    "sudo apt-get update -y",
    "sudo apt-get install -y nginx",
    "sudo systemctl start nginx",
  ]
}


