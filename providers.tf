variable "region" {
  default = "ca-montreal-1"
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.102.0"
    }
  }

  backend "s3" {
  }

}

provider "oci" {
  region = var.region
}
