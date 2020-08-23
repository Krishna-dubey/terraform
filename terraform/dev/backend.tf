terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "20904-terraform-state"
    key            = "tf-state/terraform.tfstate"
    region         = "us-east-1"
  }
}