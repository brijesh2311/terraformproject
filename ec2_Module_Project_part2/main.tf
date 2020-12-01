provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"
}

module "sg_module" {
	source = "./sg_Module"
}

module "ec2_module_1" {
	sg_id = "${module.sg_module.sg_id_output}"
	ec2_name = "Ec2 Instance 1 from module"
	source = "./ec2_module"
}

module "ec2_module_2" {
	sg_id = "${module.sg_module.sg_id_output}"
	ec2_name = "Ec2 Instance 2 from module"
	source = "./ec2_module"
}


