# --- application/main.tf ---

data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "web_instance" {
  ami                    = data.aws_ami.linux.id
  instance_type          = var.web_instance
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [var.private_sg]               # change to public
  subnet_id              = var.private_subnet
  user_data              = filebase64("install_apache.sh")
  
}


resource "aws_key_pair" "web" {
  key_name   = "project"
  public_key = file("scripts/web.pub")
}

# add security groups
# resource "aws_security_group" "web_sg" {
#     name = "project_web"
#     description = "Allow incoming HTTP connections."
#     vpc_id = var.vpc_id

#     ingress {
#         from_port = 80
#         to_port = 80
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     ingress {
#         from_port = 443
#         to_port = 443
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     ingress {
#         from_port = -1
#         to_port = -1
#         protocol = "icmp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     egress {
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     tags = {
#         Name = "WebSG"
#         Terraform = true
#     }
# }
