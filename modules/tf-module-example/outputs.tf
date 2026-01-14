output "ec2_instance_id" {
  value       = aws_instance.sample.id
  description = "The AWS ID of the EC2 instance we created."
}

output "ec2_public_ip" {
  value       = aws_instance.sample.public_ip
  description = "The public IP of the EC2 instance."
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the created VPC."
}