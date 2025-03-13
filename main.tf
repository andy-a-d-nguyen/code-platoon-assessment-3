provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "andy-tf-s3-state"
    key    = "tfstates/codeplatoon/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  tags = {
    Name = "Andy Ubuntu"
  }
}

output "ec2_connection_url" {
  value       = aws_instance.ubuntu.public_dns
  description = "Public DNS of the EC2 instance"
}
