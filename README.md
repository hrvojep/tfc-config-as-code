# Managing TFC configuration as code using Terraform

## Situation
You typically start with a TFC manually clicking around and creating workspaces, configuring VCS connection to the workspace etc.

## Challenge
As you start on-boarding more teams, projects etc the manual work involved becomes too time consuming and error prone. Hence we can use Terraform to automate most of this.

## Solution
This sample project uses Terraform code to create and configure new TFC VCS driven workspace in an existing TFC organisation.
It also creates a new GitHub repo (based on a sample repo) and configures the newly created workspace with a GitHub connection. 

You'll note that all of the heavy lifting happens in the module "vcs-connected-workspace" located in vcs-connected-workspaces.tf

You can use this is a basis for automating the TFC further. Please refer to https://registry.terraform.io/providers/hashicorp/tfe/latest/docs for more info and get ideas of what's possible and which resources are available for further automation.

## Pre-reqs
You need a TFC (app.terraform.io) account and a Gihub account, and a general knowlede of Terraform.
Please refer to variables.tf for specific inputs.

## Credits
All of the heavy lifting was done by Yulei Liu
