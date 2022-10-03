# --- application/variables.tf ---

variable "public_sg" {}
variable "private_sg" {}
variable "private_subnet" {}
variable "public_subnet" {}
variable "key_name" {}
variable "elb" {}
variable "alb_tg" {}
variable "vpc_id" {}  #added



# variable "bastion_instance_type" {
#   type    = string
#   default = "t2.micro"
# }

variable "web_instance" {
  type    = string
  default = "t2.micro"
}

