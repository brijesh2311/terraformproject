provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"
}
variable "vpcid" {
	type = "string"
	default = "vpc-0558981d3ec69748f"
}

variable "ipaddressallow" {
	type = "string"
	default = "192.168.0.0/18"
}

resource "aws_security_group" "terraformec2sg" {
  name        = "terraformec2sg"
  description = "Terraform ec2 sg group"
  vpc_id      = "${var.vpcid}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

variable "amiid" {
	default = "ami-0528a5175983e7f28"
	
}


resource "aws_instance" "terraformec2" {
  ami           = "${var.amiid}"
  instance_type = "t3.micro"
  key_name = "TrikamBrijeshFreepbx"
  vpc_security_group_ids = ["${aws_security_group.terraformec2sg.id}"]
  tags = {
    Name = "Terraform Ec2 Instance"
  }
}
