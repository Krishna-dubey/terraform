terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-state"
    key            = "tf-state/terraform.tfstate"
    region         = "us-east-1"
  }
}
