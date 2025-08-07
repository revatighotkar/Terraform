output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.Ec2_instance.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.Ec2_instance.private_ip
}
