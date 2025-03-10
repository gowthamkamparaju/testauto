provider "aws" {
  region = "ap-south-1"  # Change this to your AWS region
}
 
resource "aws_instance" "commit_instances" {
  count         = 1  # Creates 2 instances per push
  ami           = "provider "aws" {
  region = "ap-south-1"  # Change this to your AWS region
}
 
resource "aws_instance" "commit_instances" {
  count         = 2  # Creates 2 instances per push
  ami           = "ami-00bb6a80f01f03502"  # Replace with your AMI ID
  instance_type = "t2.micro"
 
  tags = {
    Name = "GitHub-Commit-Instance-${count.index + 1}"
  }
 
  user_data = <<-EOF
              #!/bin/bash
              echo "Instance started. Monitoring for 10 minutes."
              sleep 600  # 10 minutes
              shutdown -h now
              EOF
}
 
output "instance_ips" {
  value = aws_instance.commit_instances[*].public_ip
}
 "  # Replace with your AMI ID
  instance_type = "t2.micro"
 
  tags = {
    Name = "GitHub-Commit-Instance-${count.index + 1}"
  }
 
  user_data = <<-EOF
              #!/bin/bash
              echo "Instance started. Monitoring for 10 minutes."
              sleep 600  # 10 minutes
              shutdown -h now
              EOF
}
 
output "instance_ips" {
  value = aws_instance.commit_instances[*].public_ip
}
 
