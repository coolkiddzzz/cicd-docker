
terraform {
  backend "s3" {
    bucket = "mwaiyee-sctp-ce5-tfstate-bucket"
    key    = "wy.tfstate"
    region = "us-east-1"
  }
}