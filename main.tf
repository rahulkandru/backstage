terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2"
    }
    nomad = {
      source  = "hashicorp/nomad"
      version = "~> 2"
    }
    
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment      = var.environment
      CreatedBy        = local.tags.CreatedBy
      Terraform        = local.tags.Terraform
      Commit_Hash      = local.tags.Commit_Hash
      Team             = local.tags.Team
      Project          = local.tags.Project
      CostCenter       = local.tags.CostCenter
      CostCenterNumber = local.tags.CostCenterNumber
    }
  }
}
