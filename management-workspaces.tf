# ##test123
terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = ">= 0.26.1"
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

locals {
  ##this can be changed to switch between A/B github connection.
  tfc_oauth_token = tfe_oauth_client.github-b.oauth_token_id
}

provider "tfe" {
  token = var.tfe_token
}

provider "github" {
  token = var.github_personal_token
}

resource "tfe_oauth_client" "github-b" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_personal_token
  service_provider = "github"
}
