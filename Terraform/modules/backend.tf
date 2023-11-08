terraform {
    backend "s3" {
      bucket = "terraform-tfstate123"
      key    = "dev/terraform.tfstate"
      region = "us-east-1"
  }
    
}