# Required
variable "ssh_public_key" {
  type        = string
  description = "public key for sshing into instance"
}

# Optional
variable "ec2_image" {
  type    = string
  default = "ami-0084a47cc718c111a"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "availability_zone_a" {
  type    = string
  default = "eu-central-1a"
}

variable "availability_zone_b" {
  type    = string
  default = "eu-central-1b"
}