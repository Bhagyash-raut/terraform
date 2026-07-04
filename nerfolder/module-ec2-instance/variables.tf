variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance is launched"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
  default     = []
}

variable "ssh_user" {
  description = "SSH username for the EC2 instance"
  type        = string
  default     = "ubuntu"
}

variable "private_key_path" {
  description = "Path to the private key file used for SSH"
  type        = string
  default     = "batch.pem"
}

variable "provisioner_commands" {
  description = "Commands executed by remote-exec provisioner"
  type        = list(string)
  default = [
    "sudo apt-get update -y",
    "sudo apt-get install -y nginx",
    "sudo systemctl start nginx",
  ]
}
