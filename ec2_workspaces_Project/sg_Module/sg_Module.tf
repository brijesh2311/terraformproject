variable "vpcid" {
	type = "string"
	default = "vpc-0558981d3ec69748f"
}

module "shared_vars"{
  source = "../shared_vars"
}

resource "aws_security_group" "terraformec2sg" {
  name        = "sg_name_${module.shared_vars.env_suffix}"
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

output "sg_id_output" {
	value = "${aws_security_group.terraformec2sg.id}"
}

