terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance"
  }
}
