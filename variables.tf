
variable "github_personal_token" {
  type        = string
  description = "The github.com personal token"
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
  type        = string
  validation {
    condition     = length(var.tfe_token) > 90 && can(regex("[[:alnum:]]+\\.atlasv1\\.[[:alnum:]]+", var.tfe_token))
    error_message = "The tfe_token value must be a valid TFC/E personal token, containing substring \".atlasv1.\" in the middle."
  }
  description = "TFC/E token that has permission to manage workspace/policy-set/variable/notification/tags, note that orgnization/team token are not enough."
}

variable "aws_default_region" {
  type        = string
  description = "the default AWS_REGION"
  default     = "ap-southeast-2"
  validation {
    condition     = length(var.aws_default_region) > 8 && can(regex("[[:alpha:]]+-[[:alpha:]]+-[0-9]", var.aws_default_region))
    error_message = "The variable aws_default_region must be longer than 8 chars and meet the format of [[:alpha:]]+-[[:alpha:]]+-[0-9]."
  }
}