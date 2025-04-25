  environment = {
    PROJECT_DIR     = "server_python/api"
    MYSQL_USER      = var.mysql_user
    MYSQL_PASSWORD  = var.mysql_root_password
    MYSQL_DATABASE  = var.mysql_database
    MYSQL_HOST      = var.mysql_host
    MYSQL_PORT      = tostring(var.mysql_port)
  }
