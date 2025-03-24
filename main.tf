terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.0"

    }

  }

}



provider "aws" {

  region = "ap-south-1"

}



resource "aws_instance" "commit_instances" {

  count         = 1

  ami           = "ami-05c1792ced2b9b5b"

  instance_type = "t2.micro"

  tags = {

    Name = "GitHub-Commit-Instance-${timestamp()}"

  }

}



output "instance_public_ip" {

  value       = aws_instance.commit_instances[0].public_ip

  description = "Public IP address of the EC2 instance"

}
