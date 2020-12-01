provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"
}

module "sg_module" {
	source "./sg_module"
}

module "ec2_module" {
	sg_id = "${module.sg_module.sg_id_output}"
	ec2_name = "Ec2 Instance from module"
	source = "./ec2_module"
}


