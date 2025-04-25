provider "scalingo" {
  token = var.scalingo_token
}

variable "scalingo_token" {
  description = "Token API Scalingo"
  type        = string
  sensitive   = true
}

resource "scalingo_app" "html_app" {
  name   = "TerraformxScalingo"       # Tu peux mettre un autre nom si tu veux
  region = "osc-fr1"             # Tu peux adapter si tu es sur un autre datacenter
}

resource "scalingo_git_deploy_key" "deploy_key" {
  app_id = scalingo_app.html_app.id
}
