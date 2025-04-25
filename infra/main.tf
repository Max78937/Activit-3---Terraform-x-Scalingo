terraform {
  required_providers {
    scalingo = {
      source  = "registry.scalingo.com/scalingo/scalingo"
      version = "0.3.0"
    }
  }
}

provider "scalingo" {
  # Le provider lit automatiquement le token via la variable d'environnement SCALINGO_TOKEN
}

resource "scalingo_app" "html_app" {
  name   = "TerraformxScalingo"  # Tu peux changer le nom si besoin
  region = "osc-fr1"
}

resource "scalingo_git_deploy_key" "deploy_key" {
  app_id = scalingo_app.html_app.id
}
