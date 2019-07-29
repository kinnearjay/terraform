/*
this file sets up the provider (aws in this case) and puts in the secret and access key for our IAM user to programatically set up the server
*/

provider "aws" {
    access_key = "${var.acess_key}"  //access key for our IAM user
    secret_key = "${var.secret_key}" //secret key for our IAM user
    region = "${var.region}"    //region for the resources to be used by the provider (us-west-2 usually oregon)
}