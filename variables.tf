

variable "github_personal_token" {
  type        = string
  description = "The github.com personal token, at a minimum it should have repo and delete repo roles"
  validation {
    condition     = length(var.github_personal_token) > 4 && substr(var.github_personal_token, 0, 4) == "ghp_"
    error_message = "The github_personal_token value must be a valid github personal token, starting with \"ghp_\"."
  }
}

variable "organization" {
  type        = string
  description = "Name of TFC/E organization"
}

variable "tfe_token" {
  type = string
  validation {
    condition     = length(var.tfe_token) >= 90 && can(regex("[[:alnum:]]+.atlasv1.[[:alnum:]]+", var.tfe_token))
    error_message = "The tfe_token value must be a valid TFC/E personal token, containing substring \".atlasv1.\" in the middle."
  }
  description = "TFC/E token that has permission to manage workspace/policy-set/variable/notification/tags, note that orgnization/team token are not enough."
}
