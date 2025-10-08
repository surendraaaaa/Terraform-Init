# key pair

resource "aws_key_pair" "my_key" {

  key_name   = "aws_kp"
  public_key = file("aws_kp.pub")

}

# VPC

resource "aws_default_vpc" "my_vpc" {

}

# security groups

resource "aws_security_group" "my_security_group" {

  name        = var.security_group_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.my_vpc.id

  tags = {
    Name = var.security_group_name
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_https" {

  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "https port"

}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_http" {

  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "HTTP port"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_ssh" {

  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "SSH port"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {

  security_group_id = aws_security_group.my_security_group.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "All access"
}


# ec2 instance

resource "aws_instance" "my_instance" {

  for_each = tomap({
    terraform-instance-micro = "t3.micro",
    terraform-instance-small = "t3.small"
  }) # this is a for_each meta-argument

  depends_on = [aws_security_group.my_security_group]

  ami             = var.instance_ami_id #ubuntu
  instance_type   = each.value
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  user_data       = file("install_nginx.sh")

  root_block_device {
    volume_size = var.instance_block_storage
    volume_type = "gp3"
  }
  tags = {
    Name = each.key
  }
}


