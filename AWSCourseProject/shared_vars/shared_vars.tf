output "vpcid" {
	
	value = "${local.vpcid}"
}

output "publicsubnetid1" {
	
	value = "${local.publicsubnetid1}"
}

output "publicsubnetid2" {
	
	value = "${local.publicsubnetid2}"
}
output "privatesubnetid" {
	
	value = "${local.privatesubnetid}"
}
output "env_suffix" {
	
	value = "${local.env}"
}


locals {
	
env = "${terraform.workspace}"

vpcid_env = {
	default = "vpc-0558981d3ec69748f"
	staging = "vpc-0558981d3ec69748f"
	pruduction = "vpc-0558981d3ec69748f"
	}
	vpcid = "${lookup(local.vpcid_env, local.env)}"

publicsubnetid1_env = {
	default = "subnet-0c5a4fb21ee234be2"
	staging = "subnet-0c5a4fb21ee234be2"
	pruduction = "subnet-0c5a4fb21ee234be2"
	}

	publicsubnetid1 = "${lookup(local.publicsubnetid1_env, local.env)}"

publicsubnetid2_env = {
	default = "subnet-08826a98633df843b"
	staging = "subnet-08826a98633df843b"
	pruduction = "subnet-08826a98633df843b"
	}

	publicsubnetid2 = "${lookup(local.publicsubnetid2_env, local.env)}"

privatesubnetid_env = {
	default = "subnet-07a7b7b081db0360f"
	staging = "subnet-07a7b7b081db0360f"
	pruduction = "subnet-07a7b7b081db0360f"
	}

	privatesubnetid = "${lookup(local.privatesubnetid_env, local.env)}"
}
