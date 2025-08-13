terraform {

  backend "s3" {
    bucket = "terraform-state-backup0101"
    key    = "eks/private/terraform.tfstate"
    region = "ap-south-1"
  }
}