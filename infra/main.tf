terraform {
  required_providers {
    scalingo = {
      source  = "registry.scalingo.com/scalingo/scalingo"
      version = "0.3.0"
    }
  }
}

provider "scalingo" {
  token = var.scalingo_token
}

variable "scalingo_token" {
  description = "Token API Scalingo"
  type        = string
  sensitive   = true
}

resource "scalingo_app" "html_app" {
  name   = "TerraformxScalingo"
  region = "osc-fr1"
}

resource "scalingo_git_deploy_key" "deploy_key" {
  app_id = scalingo_app.html_app.id
}
