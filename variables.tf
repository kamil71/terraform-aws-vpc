variable "environment" {
  description = "Environment description"
  type        = string
  #  default     = "Production"
}

variable "aws_region" {
  description = "region description"
  type        = string
  #  default     = "us-east-1"
}

#AMIs Region Mapping
variable "aws_amis" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-04505e74c0741db8d"
    "ap-south-1" = "ami-0851b76e8b1bce90b"
  }
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

#variable "public_subnets_cidr" {
# type        = list(any)
# description = "The CIDR block for the public subnets"
#default     = ["10.0.1.0/24"]
#}

#variable "private_subnets_cidr" {
#  type        = list(any)
#  description = "The CIDR block for the private subnets"
#default     = ["10.0.2.0/24"]
#}

#variable "availability_zones" {
##  type        = list(any)
# description = "The az that the resources will be launched"
# default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
#}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 22, 443]
}

# Definign Key Name for connection
variable "key_name" {
  default     = "kamil-terraform"
  description = "Name of AWS key pair"
}

variable "public_subnet_numbers" {
  type = map(number)
  description = "Map of AZ to a number that should be used for public subnets"
  default = {
    "us-east-1a" = 1
    "us-east-1b" = 2
    "us-east-1c" = 3
  }
}

variable "private_subnet_numbers" {
  type = map(number)
  description = "Map of AZ to a number that should be used for private subnets"
  default = {
    "us-east-1a" = 4
    "us-east-1b" = 5
    "us-east-1c" = 6
  }
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list(any)
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list(any)
  description = "List of availability zones"
}

variable "alarms_email" {
  default     = "pkamil717@gmail.com"
  type = string
}