variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.30.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.30.1.0/24"
}

variable "key_path" {
  default = "public_key"
}

variable "aws_key_pair" {
  default = "~/.ssh/pemfile/stage.pem"
}