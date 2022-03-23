terraform {
  backend "s3" {
    bucket = "talent-academy-837668009166-tfstates-alex"
    key    = "training-terraform/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}