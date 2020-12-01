module "shared_vars" {
	source = "../shared_vars"
}

variable privatesg_id {}
variable tg_arn {}

locals {
	env = "${terraform.workspace}"
	
	amiid_env = {
		default = "ami-0e472933a1395e172"
		staging = "ami-0e472933a1395e172"
		pruduction = "ami-0e472933a1395e172"
	}

	amiid = "${lookup(local.amiid_env, local.env)}"

instancetype_env = {
		default = "t2.micro"
		staging = "t2.micro"
		pruduction = "t2.medium"
	}

	instancetype = "${lookup(local.instancetype_env, local.env)}"	

keyparename_env = {
		default = "aws_project_staging"
		staging = "aws_project_staging"
		pruduction = "aws_project_production"
	}
	keyparename = "${lookup(local.keyparename_env, local.env)}"	

asgdesired_env = {
		default = "1"
		staging = "1"
		pruduction = "2"
	}
	asgdesired = "${lookup(local.asgdesired_env, local.env)}"	

asgmin_env = {
		default = "1"
		staging = "1"
		pruduction = "2"
	}
	asgmin = "${lookup(local.asgmin_env, local.env)}"	

asgmax_env = {
		default = "2"
		staging = "2"
		pruduction = "4"
	}
	asgmax = "${lookup(local.asgmax_env, local.env)}"	


} 



resource "aws_launch_configuration" "sampleapp_lc" {
  name          = "sampleapp_ls_${local.env}"
  image_id      = "${local.amiid}"
  instance_type = "${local.instancetype}"
  key_name		= "${local.keyparename}"
  user_data		=	"${file("assets/userdata.txt")}"
  security_groups  = ["${var.privatesg_id}"]
}

resource "aws_autoscaling_group" "sampleapp_asg" {
  name                 = "sampleapp_asg_${module.shared_vars.env_suffix}"
  max_size             = "${local.asgmax}"
  min_size             = "${local.asgmin}"
  desired_capacity		= "${local.asgdesired}"
  launch_configuration = "${aws_launch_configuration.sampleapp_lc.name}"
  vpc_zone_identifier  = ["${module.shared_vars.publicsubnetid1}"]
  target_group_arns	   = ["${var.tg_arn}"]	

  tags = [
      {
        "key"                 = "Name"
        "value"               = "SampleApp_${module.shared_vars.env_suffix}"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "Environment"
        "value"               = "${module.shared_vars.env_suffix}"
        "propagate_at_launch" = true
      }
    ]
    
}