terraform {
   required_providers {
      google = {
         source = "hashicorp/google"
         version = "3.47.0"
      }
      kubernetes = {
         source = "hashicorp/kubernetes"
         version = "1.13.3"
      }
   }
   backend "gcs" {
      bucket = "tf-k8s-workshop"
      prefix = "terraform/demo"
   }
}

provider "google" {
   region = "us-central-1"
}
