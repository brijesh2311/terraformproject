provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"
}

module "sg_module" {	
	source = "./sg_Module"
}

module "ec2_module_1" {
	sg_id = "${module.sg_module.sg_id_output}"
	source = "./ec2_module"
}

locals {
	env = "${terraform.workspace}"
	
	amiid_env = {
		default = "amiid_default"
		staging = "amiid_staging"
		production = "amiid_production"
	}

	amiid = "${lookup(local.amiid_env, local.env)}"
}
output "envspecicountput_variable" {
	value = "${local.amiid}"

}