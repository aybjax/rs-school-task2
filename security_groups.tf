# Bastion
resource "aws_security_group" "sg_bastion" {
  vpc_id = aws_vpc.main.id
  name   = "rs-task2-instance-security-group-bastion"
}

resource "aws_security_group_rule" "allow_ssh_inbound_bastion" {
  type              = "ingress"
  security_group_id = aws_security_group.sg_bastion.id

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_outbound_bastion" {
  type              = "egress"
  security_group_id = aws_security_group.sg_bastion.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# Public

resource "aws_security_group" "sg_public" {
  vpc_id = aws_vpc.main.id
  name   = "rs-task2-instance-security-group-public"
}

resource "aws_security_group_rule" "allow_http_inbound_public" {
  type              = "ingress"
  security_group_id = aws_security_group.sg_public.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_ssh_inbound_public" {
  type              = "ingress"
  security_group_id = aws_security_group.sg_public.id

  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_bastion.id
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.sg_public.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# Private
resource "aws_security_group" "sg_private" {
  vpc_id = aws_vpc.main.id
  name   = "rs-task2-instance-security-group-private"
}
resource "aws_security_group_rule" "allow_http_inbound_private" {
  type              = "ingress"
  security_group_id = aws_security_group.sg_private.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_ssh_inbound_private" {
  type              = "ingress"
  security_group_id = aws_security_group.sg_private.id

  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_bastion.id
}

resource "aws_security_group_rule" "allow_all_outbound_private" {
  type              = "egress"
  security_group_id = aws_security_group.sg_private.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
# Application load balancer
resource "aws_security_group" "alb_a" {
  vpc_id = aws_vpc.main.id
  name   = "alb-security-group_AZ_a"
}

resource "aws_security_group" "alb_b" {
  vpc_id = aws_vpc.main.id
  name   = "alb-security-group_AZ_b"
}

resource "aws_security_group_rule" "allow_alb_http_inbound_a" {
  type              = "ingress"
  security_group_id = aws_security_group.alb_a.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_alb_http_inbound_b" {
  type              = "ingress"
  security_group_id = aws_security_group.alb_b.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_alb_all_outbound_a" {
  type              = "egress"
  security_group_id = aws_security_group.alb_a.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_alb_all_outbound_b" {
  type              = "egress"
  security_group_id = aws_security_group.alb_b.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}