variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "Vpc Cidr Block"
    type = string
  
}
variable "private-subnet-1-cidr" {
    default = "10.0.1.0/24"
    description = "Private Subnet 1 Cidr Block"
    type = string
  
}
variable "AZ" {
    description = "my AZ forPrivate Subnet 1"
    type = string
    default = "us-east-2"
  
}
variable "private-subnet-2-cidr" {
    default = "10.0.2.0/24"
    description = "Public Subnet 2 Cidr Block"
    type = string
  
}
variable "public-subnet-1-cidr" {
    default = "10.0.3.0/24"
    description = "Public Subnet 1 Cidr Block"
    type = string
  
}
variable "public-subnet-2-cidr" {
    default = "10.0.4.0/24"
    description = "Public Subnet 2 Cidr Block"
    type = string
  
}