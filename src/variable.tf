variable "aws" {
  default = {
    profile = "default"
    region  = "ap-northeast-1"
  }
}

variable "vpc_cider" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPCのCIDR"
}

variable "vpc_name" {
  type        = string
  default     = "terraform_handson_on_docker_vpc"
  description = "VPCの名前"
}

variable "az_names" {
  type = map(string)
  default = {
    "1a" = "ap-northeast-1a"
    "1c" = "ap-northeast-1c"
    "1d" = "ap-northeast-1d"
  }
  description = "Availability_zoneの名前"
}

variable "public_subnet_1a_name" {
  type        = string
  default     = "public_subnet_1a"
  description = "パブリックサブネットの名前"
}

variable "igw_name" {
  type        = string
  default     = "terraform_handson_on_docker_igw"
  description = "インターネットゲートウェイの名前"
}

variable "route_table_name" {
  type        = string
  default     = "terraform_handson_on_docker_route_table"
  description = "ルートテーブルの名前"
}

variable "cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDRのデフォルトのIPアドレス"
}

variable "sg_name" {
  type        = string
  default     = "terraform_handson_on_docker_sg"
  description = "セキュリティグループの名前"
}

variable "ssh_port" {
  type        = number
  default     = 22
  description = "SSHポートのデフォルト値"
}

variable "instance_ami_id" {
  type        = string
  default     = "ami-0ff21806645c5e492"
  description = "EC2インスタンス生成時に指定するデフォルトのAMIのID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2インスタンスのデフォルトのインスタンスタイプ"
}

variable "aws_key_name" {
  type        = string
  default     = "terraform_handson_on_docker"
  description = "EC2インスタンスにSSHでアクセスする際に使用するKey名"
}

variable "root_volume_type" {
  type        = string
  default     = "gp2"
  description = "EBSにおけるルートボリュームのデフォルトのtype"
}

variable "root_volume_size" {
  type        = number
  default     = 100
  description = "EBSにおけるルートボリュームのデフォルトのボリューム容量"
}

variable "instance_name" {
  type        = string
  default     = "terraform_handson_on_docker_ec2"
  description = "EC2インスタンスの名前"
}
