locals {
  # Take a directory of YAML files, read each one that matches naming pattern and bring them in to Terraform's native data set. Note the .yaml file 
  #has to be named worspaceXXXX.yaml for instance workspace-dev-appX-webtier.yaml
  inputvcsworkspacevar = [for f in fileset(path.module, "vcs-connected-workspaces/{workspace}*.yaml") : yamldecode(file(f))]
  # Take that data set and format it so that it can be used with the for_each command by converting it to a map where each top level key is a unique identifier.
  # In this case I am using the appid key from my example YAML files. The name of the workspace created will be called worspace.name
  inputvcsworkspacemap = { for workspace in toset(local.inputvcsworkspacevar) : workspace.name => workspace }

}

module "vcs-connected-workspace" {
  source  = "app.terraform.io/h-test/vcs-connected-workspace/tfe"
  version = "0.1.1"


  # insert the 5 required variables here 
  for_each              = local.inputvcsworkspacemap
  organization          = var.organization
  name                  = each.value.name
  terraform_version     = each.value.version
  tfc_oauth_token       = local.tfc_oauth_token
  workspace_description = each.value.description
  tags                  = each.value.tags
  github_owner          = each.value.github_owner
  template_repo         = each.value.template_repo
}