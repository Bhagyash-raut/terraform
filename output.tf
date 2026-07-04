output "asg_name" {

  description = "Autoscaling group name"

  value = aws_autoscaling_group.example0.name

}

output "alb_arn" {

  description = "Application Load Balancer ARN"

  value = aws_lb.dev.arn

}

output "alb_dns_name" {

  description = "Application Load Balancer DNS name"

  value = aws_lb.dev.dns_name

}


