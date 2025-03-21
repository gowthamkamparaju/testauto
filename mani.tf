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

  count = 1  # Adjust if needed



  ami           = "ami-05c1f92ced2b9b5b5"  # Replace with your AMI ID

  instance_type = "t2.micro"



  tags = {

    Name = "GitHub-Commit-Instance-${count.index + 1}"

  }

}
