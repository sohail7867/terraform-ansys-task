resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  security_groups  = var.security_group_ids 
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = var.instance_name
  }

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable nginx1
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}