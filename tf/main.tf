provider "aws" {
    region = "us-east-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_security_group" "vaibhav_strapi_sg" {
    name        = "vaibhav_strapi_sg"
    description = "strapi security group"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 1337
        to_port     = 1337
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = var.ec2_public_key
}


resource "aws_instance" "strapi_instance" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.small"
  vpc_security_group_ids = [aws_security_group.vaibhav_strapi_sg.id]
  key_name      = aws_key_pair.ec2-key.key_name

  tags = {
    Name = "Vaibhav-Strapi-Docker"
  }
}

output "public_ip" {
  value = aws_instance.strapi_instance.public_ip
}