terraform {
  required_providers {
    scalingo = {
      source  = "registry.scalingo.com/scalingo/scalingo"
      version = "0.3.0"
    }
  }
}

provider "scalingo" {
  # Rien ici : SCALINGO_TOKEN est lu depuis les variables d’environnement
}

variable "scalingo_token" {
  description = "Token API Scalingo (utilisé uniquement si besoin manuel)"
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
