variable "amiid" {
	default = "ami-0528a5175983e7f28"
	
}

module "shared_vars" {
	
	source = "../shared_vars"
}
variable "sg_id" {}

resource "aws_instance" "terraformec2" {
  ami           = "${var.amiid}"
  instance_type = "t3.micro"
  key_name = "TrikamBrijeshFreepbx"
  vpc_security_group_ids = ["${var.sg_id}"]
  tags = {
    Name = "Ec2_name_instance_${module.shared_vars.env_suffix}"
  }
}