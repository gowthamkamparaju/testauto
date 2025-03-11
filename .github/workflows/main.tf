terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.0"

    }

  }

}



provider "aws" {

  region = "ap-south-1"  # Change this to your AWS region

}



resource "aws_instance" "commit_instances" {

  count         = 1  # Creates 1 instances per push

  ami           = "ami-08bb6a6800f0f03502"  # Replace with your AMI ID

  instance_type = "t2.micro"



  tags = {

    Name = "GitHub-Commit-Instance-${count.index + 1}"

  }



  user_data = <<-EOF

  #!/bin/bash

  echo "Instance started. Monitoring for 10 minutes."

  sleep 600  # 10 minutes

  shutdown -h now

  EOF

}



output "instance_ids" {

  value = aws_instance.commit_instances[*].id

}



output "public_ips" {

  value = aws_instance.commit_instances[*].public_ip

}
