output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id,
  ]
}

output "public_subnets" {
  value = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id,
  ]
}

output "bastion-public-ip" {
  value = aws_instance.bastion.public_ip
}

output "public-ec2-private-ips" {
  value = {
    "subnet_a_ec2" : aws_instance.public_ec2_1.private_ip,
    "subnet_b_ec2" : aws_instance.public_ec2_2.private_ip
  }
}

output "private-ec2-private-ips" {
  value = {
    "subnet_a_ec2" : aws_instance.private_ec2_1.private_ip,
    "subnet_b_ec2" : aws_instance.private_ec2_2.private_ip
  }
}

output "load_balancer_dns" {
  value = aws_lb.load_balancer.dns_name
}