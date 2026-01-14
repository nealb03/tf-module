###########################################################
# Outputs (DISABLED for demo)
###########################################################

# NOTE:
# These outputs referenced resources that we have commented out in main.tf
# (aws_instance.sample, aws_vpc.this). For the GitHub Actions demo,
# we disable the outputs so terraform validate/plan/apply succeed with no
# managed resources. The code is left here for interview review.

# output "ec2_instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.sample.id
# }
#
# output "ec2_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.sample.public_ip
# }
#
# output "vpc_id" {
#   description = "ID of the VPC created by this module"
#   value       = aws_vpc.this.id
# }
