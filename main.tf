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

resource "aws_security_group" "andy_assessment_3" {
  name        = "andy_assessment_3"
  description = "Allow inbound traffic on port 3000 and 22"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to all IPs; restrict as needed for security
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to all IPs; restrict as needed for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  key_name               = "andy-east1"
  vpc_security_group_ids = [aws_security_group.andy_assessment_3.id]
  tags = {
    Name = "Andy Ubuntu"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "Checking EC2 liveness..."
      while ! nc -zv ${aws_instance.ubuntu.public_ip} 22; do
        echo "Waiting for EC2 instance to respond on port 22..."
        sleep 5
      done
      echo "EC2 instance is live!"
    EOT
  }
}

output "ec2_connection_url" {
  value       = aws_instance.ubuntu.public_dns
  description = "Public DNS of the EC2 instance"
}
