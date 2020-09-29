#----------------------------------------------------------
# My Terraform
#
# Find Latest AMI id of:
#    - Ubuntu 18.04
#    - Amazon Linux 2
#    - Windows Server 2016 Base
#
# Made by Alex Largman
#-----------------------------------------------------------

provider "aws" {
  region = "ap-southeast-2"
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20200917.0-x86_64-gp2"]
  }
}

data "aws_ami" "latest_windows" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-ContainersLatest-*"]
  }
}

#Ubuntu output
output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}

#Linux outout
output "latest_amazon_linux_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_name" {
  value = data.aws_ami.latest_amazon_linux.name
}

#Windows outout
output "latest_windows_id" {
  value = data.aws_ami.latest_windows.id
}

output "latest_windows_name" {
  value = data.aws_ami.latest_windows.name
}
