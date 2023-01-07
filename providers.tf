provider "aws" {
    region = "us-east-2"
    
  
}
terraform {
  backend "s3" {
      bucket = "terraformsantu-tfstate"
      key = "santuprojects/project01/terraform.tfstate"
      region = "us-east-2"

      dynamodb_table = "santutfstat01"

  }
}