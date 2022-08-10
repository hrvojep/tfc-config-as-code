# Managing TFC configuration as code using Terraform

## Situation
You typically start with a TFC manually clicking around and creating workspaces, configuring VCS connection to the workspace etc.

## Challenge
As you start on-boarding more teams, projects etc the manual work involved becomes too time confusing and error prone. Hence we can use Terraform to most of this heavy lifting

## Solutiion
This sample project uses Terraform code to create and configure new TFC VCS driven workspace in an existing TFC organisation.
It also creates a new GitHub repo (based on a sample repo) and configures the newly created workspace with a GitHub connection. 

You'll note that all of the heavy lifting happens in the module "vcs-connected-workspace" located in vcs-connected-workspaces.tf

You can use this is a basis for automating the TFC further. Please refer to https://registry.terraform.io/providers/hashicorp/tfe/latest/docs for more info and get ideas of what's possible and which resources are available for further automation.

## Credit
All of the heavy lifting was done by Yulei Liu
