terraform {
  required_providers {
    scalingo = {
      source  = "registry.scalingo.com/scalingo/scalingo"
      version = "0.3.0"
    }
  }
}

provider "scalingo" {
  # Le token est lu via la variable d'environnement SCALINGO_TOKEN
}

resource "scalingo_app" "html_app" {
  name = "TerraformxScalingo"
}
