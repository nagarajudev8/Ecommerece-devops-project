variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
}

variable "availability_zones" {
    description = "Availability zones for the subnets"
    type = list(string)
}
variable "private_subnet_cidrs" {
    description = "List of private subnet CIDR blocks"
    type = list(string)
}
variable "public_subnet_cidrs" {
    description = "List of public subnet CIDR blocks"
    type = list(string)
}

variable "cluster_name" {
    description = "EKS cluster name"
    type = string
}