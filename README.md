# azure-cloud-webapp
we created for terraform file for run web app using terraform
main.tf, variable.tf, outputs.tf, terraform.tfvars

- in main.tf file we create provider block that mention this file using azure as cloud provider, also use subscription id and use Cli it means use current login.
- then mentioned resources group name and location that get form terraform.tfvars file.

- after that we code for app service plan where mentioned os type and sku plan.

- after that we code for application insights and azure storage account.

- then we are coding for actual web app on azure using terraform.

- outputs.tf file define final webapp url.
- variable.tf file define all variable name and functions.
- and terraform.tfvars mentioned value using to build terraform.