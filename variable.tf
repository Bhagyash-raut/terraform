variable "ami_id" {

  description = "The ID of the AMI to use for the instance"

  type = string

  default = "ami-0e38835daf6b8a2b9"

}

variable "instance_type" {

  description = "The EC2 instance type"

  type = string

  default = "t3.micro"

}

variable "security_group_id" {

  description = "Security Group ID"

  type = string

  default = "sg-044657afd62ad78cc"

}

variable "subnet_ids" {

  description = "List of subnet IDs for the load balancer and instance placement"

  type = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "At least two subnet IDs in different Availability Zones must be provided for the ALB."
  }
}

variable "asg_min_size" {
  description = "Minimum number of instances in the autoscaling group"
  type        = number
  default     = 1
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the autoscaling group"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum number of instances in the autoscaling group"
  type        = number
  default     = 3
}

# Ensure sizes satisfy: asg_min_size <= asg_desired_capacity <= asg_max_size

