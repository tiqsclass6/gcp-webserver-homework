variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "vpc_name" {
  default = "custom-web-vpc"
}

variable "vpc_cidr" {
  default = "10.230.0.0/16" # Use your own CDIR
}

variable "public_subnet_name" {
  default = "public-subnet"
}

variable "private_subnet_name" {
  default = "private-subnet"
}

variable "public_subnet_cidr" { 
  default = "10.230.1.0/24" # Use your own public subnet CDIR
}

variable "private_subnet_cidr" {
  default = "10.230.11.0/24" # Use your own private subnet CDIR
}