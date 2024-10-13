resource "aws_instance" "bastion" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg_bastion.id]
  subnet_id              = aws_subnet.public_subnet_a.id
  key_name               = "ssh_key"

  associate_public_ip_address = true
  tags = {
    "Name" = "Bastion task2"
  }
}

resource "aws_instance" "public_ec2_1" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  subnet_id              = aws_subnet.public_subnet_a.id
  key_name               = "ssh_key"

  user_data = <<-EOF
              #!/bin/bash

              echo "Hello, World! from <h1>Public subnet 1</h1>" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    "Name" = "Public 1 task2"
  }
}

resource "aws_instance" "public_ec2_2" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  subnet_id              = aws_subnet.public_subnet_b.id
  key_name               = "ssh_key"
  user_data              = <<-EOF
              #!/bin/bash

              echo "Hello, World! from <h1>Public subnet 2</h1>" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    "Name" = "Public 2 task2"
  }
}

resource "aws_instance" "private_ec2_1" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg_private.id]
  subnet_id              = aws_subnet.private_subnet_a.id
  key_name               = "ssh_key"
  user_data              = <<-EOF
              #!/bin/bash

              echo "Hello, World! from <h1>Private subnet 1</h1>" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    "Name" = "Private 1 task2"
  }
}

resource "aws_instance" "private_ec2_2" {
  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.sg_private.id]
  subnet_id              = aws_subnet.private_subnet_b.id
  key_name               = "ssh_key"
  user_data              = <<-EOF
              #!/bin/bash

              echo "Hello, World! from <h1>Private subnet 2</h1>" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    "Name" = "Private 2 task2"
  }
}
