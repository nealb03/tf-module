########################################
# Provider
#######################################

provider "aws" {
  region = "us-east-1"
}

#######################################
# Networking (VPC, subnet, routing)
#######################################

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.ec2_instance_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.ec2_instance_name}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${var.ec2_instance_name}-public-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.ec2_instance_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

#######################################
# Security group
#######################################

resource "aws_security_group" "ec2_sg" {
  name        = "${var.ec2_instance_name}-sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.this.id

  # Allow SSH from anywhere (for testing only; tighten later)
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.ec2_instance_name}-sg"
  }
}

#######################################
# EC2 instance
#######################################

resource "aws_instance" "sample" {
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  # Use the key pair you created in AWS (you can also make this a variable)
  key_name = "tf-builder-key"

  tags = {
    Name = var.ec2_instance_name
  }
}
