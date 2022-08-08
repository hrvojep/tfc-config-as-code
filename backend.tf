terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = var.organization

    workspaces {
      name = "tfc-config-as-code"
    }
  }
}
