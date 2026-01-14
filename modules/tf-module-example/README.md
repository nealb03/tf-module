# My TF module
This is an example to setup the infrastructure

## Usage
Sample usage:
~~
module "my_ec2_instance" {
  source = "github.com/nealb03/tf-module/tree/main/modules"

  ec2_instance_type = "t2.micro"
  ec2_instance_name = "base-image-builder"
  number_of_instances = 1
  ec2_ami_i  = < your AMI ID to use to launch the instance>
}
