resource "aws_lb_target_group" "instances" {
  name     = "example-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "public_1" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.public_ec2_1.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "public_2" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.public_ec2_2.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "private_1" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.private_ec2_1.id
  port             = 8080
}


resource "aws_lb_target_group_attachment" "private_2" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.private_ec2_2.id
  port             = 8080
}
