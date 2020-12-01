provider "aws" {
	region     = "us-west-2"
	profile = "terraformchirag"

}

//this is a string variable
variable "myfirststring" {
		type = "string"
		default = "This is my first string"
}

variable "multilinestring" {
		type = "string"
		default = <<EOH
		THis is a multiline 
		string
		new line 
		EOH
}
output "myfirstoutput"{
	value = "${var.myfirststring}"
}

output "mymultilineoutput" {
	value = "${var.multilinestring}"
}

//this is my maps example

variable "mapexample" {
	type = "map"
	default = {
		"usest" = "ami1"
		"euwest" = "ami2"
	}
}
output "mapoutput" {
	value = "${var.mapexample["usest"]}"
}

//this is array/list

variable "mysglist"{
		type = "list"
		default = ["sg1","sg2","sg3","sg4"]
}

output "mysglist"{
	value = "${var.mysglist}"
}

variable "testbool"{
	default = "true"
}

output "booloutput"{
	value = "${var.testbool}"
}


variable "myfirstinput"{
	type = "string"
}

output "myoutput" {
	sensitive = true
	value = "${var.myfirstinput}"
}
