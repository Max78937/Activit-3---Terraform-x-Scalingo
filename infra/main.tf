terraform {
  required_providers {
    scalingo = {
      source  = "Scalingo/scalingo"
      version = "~> 1.0"
    }
  }
}

provider "scalingo" {
  api_token = var.scalingo_token
}

variable "scalingo_token" {
  description = "Token API Scalingo"
  type        = string
}

resource "scalingo_app" "html_app" {
  name = "TerraformxScalingo"
}
