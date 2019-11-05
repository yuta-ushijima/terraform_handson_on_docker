# AWS設定
provider "aws" {
  region   = var.aws["region"]
  profile  = var.aws["profile"]
}

# VPC
resource "aws_vpc" "of_terraform_handson_on_docker" {
  cidr_block = var.vpc_cider
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = var.vpc_name
  }
}

# パブリックサブネット1aの定義
resource "aws_subnet" "of_public_1a" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.of_terraform_handson_on_docker.id
  availability_zone = var.az_names["1a"]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_1a_name
  }
  timeouts {
    delete =  "5m"
  }
}

# インターネットゲートウェイの定義
resource "aws_internet_gateway" "of_public" {
  vpc_id = aws_vpc.of_terraform_handson_on_docker.id
  tags = {
    Name = var.igw_name
  }
}

# ルートテーブルの定義
resource "aws_route_table" "of_public" {
  vpc_id = aws_vpc.of_terraform_handson_on_docker.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.of_public.id
  }
  tags = {
    Name = var.route_table_name
  }
}

# ルートテーブルとサブネットの紐付け
resource "aws_route_table_association" "of_public_1a" {
  route_table_id = aws_route_table.of_public.id
  subnet_id = aws_subnet.of_public_1a.id
}

# セキュリティグループの定義
resource "aws_security_group" "of_terraform_handson_on_docker" {
  name = var.sg_name
  vpc_id = aws_vpc.of_terraform_handson_on_docker.id
  description = "Define of SG for public"
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = var.cidr_blocks
  }
  tags = {
    Name = var.sg_name
  }
}

# セキュリティグループルール(SSHのインバウンド)の定義
resource "aws_security_group_rule" "of_ssh_ingress" {
  type = "ingress"
  from_port = var.ssh_port
  protocol = "tcp"
  security_group_id = aws_security_group.of_terraform_handson_on_docker.id
  to_port = var.ssh_port
  cidr_blocks = var.cidr_blocks
  description = "ssh inbound of SG for public"
}

resource "aws_instance" "of_public" {
  ami = var.instance_ami_id
  instance_type = var.instance_type
  key_name = var.aws_key_name
  subnet_id = aws_subnet.of_public_1a.id
  vpc_security_group_ids = [
    aws_security_group.of_terraform_handson_on_docker.id
  ]
  associate_public_ip_address = "true"
  root_block_device {
    volume_type =  var.root_volume_type
    volume_size = "20" # root_block内なので、一旦20で固定
  }
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
  }
  tags = {
    Name = var.instance_name
  }
}
