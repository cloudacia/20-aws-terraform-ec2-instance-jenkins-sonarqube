# AWS REGION
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

# AWS VPC CIDR
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = ""
}

# AWS SUBNET #1 IP SUBNET
variable "subnet01" {
  type        = string
  default     = "10.0.1.0/24"
  description = "A public network"
}

# AWS AVAILABILITY ZONE
variable "availability_zone01" {
  type        = string
  default     = "use1-az1"
  description = "US East (N. Virginia)"
}

# AWS AMI IMANGE (CENTOS 7)
variable "aws_amis" {
  type    = string
  default = "ami-0affd4508a5d2481b"
}


# AWS INSTANCE TYPE
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
