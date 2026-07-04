output "instance_id" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.example[*].id
}

output "public_ip" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.example[*].public_ip
}
