terraform {
  required_providers {
    scalingo = {
      source  = "scalingo/scalingo"
      version = "2.3.0"
    }
  }
}

variable "scalingo_token" {
  description = "Token API Scalingo"
  type        = string
  sensitive   = true
}

variable "mysql_root_password" {
  type      = string
  sensitive = true
}

variable "mysql_port" {
  type = number
}

variable "mysql_user" {
  type = string
}

variable "mysql_database" {
  type = string
}

variable "mysql_host" {
  type = string
}

provider "scalingo" {
  api_token = var.scalingo_token
  region    = "osc-fr1"
}

resource "scalingo_app" "python_api" {
  name = "python-api-ynov"

  environment = {
    PROJECT_DIR     = "server_python/api"
    MYSQL_USER      = var.mysql_user
    MYSQL_PASSWORD  = var.mysql_root_password
    MYSQL_DATABASE  = var.mysql_database
    MYSQL_HOST      = var.mysql_host
    MYSQL_PORT      = tostring(var.mysql_port)
  }
}

resource "scalingo_addon" "db" {
  provider_id = "mysql"
  plan        = "mysql-starter-512"
  app         = scalingo_app.python_api.id
}

resource "scalingo_container_type" "web" {
  app    = scalingo_app.python_api.name
  name   = "web"
  amount = 1
  size   = "S"
}
