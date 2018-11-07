# Terraform Workflow Plug-in Step Package

This package contains a collection of vCommander workflow plug-in steps for working with [Terraform](https://www.terraform.io/) configurations. 

It was designed specifically for use in the *Deploying User Provided Terraform Configurations* & *Deploying Terraform Configurations* scenarios.

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Generate Terraform Plan
+ Apply Terraform Plan
+ Destroy Terraform-managed infrastructure

### Generate Terraform Plan
**Purpose:** Runs the `terraform plan` command to generate a list of changes that would be performed

**Details:** 

 * [https://www.terraform.io/docs/commands/plan.html](https://www.terraform.io/docs/commands/plan.html)
 * This step uses an intermediate server, which is accessible through SSH, to keep the Terraform state. Referred to hereafter as the Terraform host.
 * This step requires the Terraform binaries be installed on the intermediate server
 * This step is meant for an approval workflow

**Workflows supporting this plug-in step:**

* Command workflows
* Approval workflows for a new request
* Completion workflows for a custom component 
* Approval workflows for a change request
* Completion workflows for a change request

**Inputs:** 

* Step Name: Input field for the name of the step
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Timeout: Input field for the time in milliseconds to wait for each command to complete
* Sys Credentials: Input field for the credentials for the Terraform host
* Terraform Host: Input field for the hostname or IP for the Terraform host
* Working Directory: (Optional) Input field for the working directory on the Terraform host for the state files.  If left blank, the step defaults to `/tmp/embotics-terraform`.
* Plan ID: (Optional) Input field for the name of the directory that contains the state files.  If left blank, the step defaults to `#{request.id}`.
* Terraform Binary: (Optional)  Input field for the path to the terraform binary on the terraform host. If left blank, the step defaults to `terraform`.
* Configuration: Input field for Terraform configuration, as a substitution variable
* Inject Tags: Checkbox to indicate if vCommander metadata (ownership & organization) should be injected   
* Variables: Input field for Terraform variables as key=value pairs, separated by space or new line. Optional

### Apply Terraform Plan
**Purpose:** Runs the `terraform apply` command to to create/modify the resources according to the configuration plan

**Details:** 

 * [https://www.terraform.io/docs/commands/apply.html](https://www.terraform.io/docs/commands/apply.html)
 * This step uses an intermediate server, which is accessible through SSH, to keep the Terraform state. Referred to hereafter as the Terraform host.
 * This step requires the Terraform binaries be installed on the intermediate server
 * This step is meant for custom component or change request completion workflow

**Workflows supporting this plug-in step:**

  * Command workflows
  * Approval workflows for a new request
  * Completion workflows for a custom component 
  * Approval workflows for a change request
  * Completion workflows for a change request

**Inputs:** 

* Step Name: Input field for the name of the step
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Timeout: Input field for the time in milliseconds to wait for each command to complete
* Sys Credentials:  Input field for the Terraform host's system credentials
* Terraform Host: Input field for the Terraform host's hostname or IP address
* Working Directory: (Optional) Input field to specify the working directory on the terraform host for the state files. If left blank, the step defaults to `/tmp/embotics-terraform`.
* Plan ID: (Optional) Input field to specify the name of the directory that contains the state files. If left blank, the step defaults to `#{request.id}`.
* Terraform Binary: (Optional) Input field to specify the path to the Terraform binary on the Terraform host. If left blank, the step defaults to `terraform`.
* Inject Tags: Checkbox to indicate if vCommander metadata (ownership & organization) should be injected
* Configuration: Input field for Terraform configuration as a substitution variable
* Variables: (Optional) Input field for Terraform variables as key=value pairs, separated by space or new line.

### Destroy Terraform-managed infrastructure
**Purpose:** Runs the `terraform destroy` command to delete Terraform-managed infrastructure

**Details:** 
 * *[https://www.terraform.io/docs/commands/destroy.html](https://www.terraform.io/docs/commands/destroy.html)*
 * This step uses an intermediate server, which is accessible through SSH, to keep the Terraform state. Referred to hereafter as the Terraform host
 * This step requires the terraform binaries be installed on the intermediate server
 * This step is meant for a completion workflow

**Inputs:** 

* Step Name: Input field for the name of the step
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Timeout: Input field for the amount of time in milliseconds to wait for each command to complete
* Sys Credentials:  Input field for the Terraform host's system credentials
* Terraform Host: Input field for the Terraform host's hostname or IP address
* Working Directory: (Optional) Input field for the working directory on the Terraform host for the state files. If left blank, step defaults to `/tmp/embotics-terraform`.
* Plan ID: (Optional) Input field to specify the name of the directory that contains the state files. If left blank, the step defaults to `#{request.id}`.
* Terraform Binary: (Optional) Input field to specify the path to the terraform binary on the terraform host. If left blank, the step defaults to `terraform`.
* Variables: (Optional) Input field for Terraform variables as key=value pairs, separated by space or new line.


## Installation

Workflow plug-in steps are supported with vCommander release 7.0.2 and higher. 

See [Adding Workflow Plug-in Steps](http://docs.embotics.com/vCommander/Adding-Plug-In-WF-Steps.htm) in the vCommander documentation to learn how to install this package. 

## Return codes

### Generic return codes

*Examples:*

+ **0** - *Step completed successfully*
+ **101** - *Error parsing the configuration to inject tags *
+ **102** - *Error injecting tags in to the configuration*
+ **103** - *Error creating the working directory on the terraform host*
+ **104** - *Error executing terraform init*
+ **105** - *Error executing terraform apply*
+ **106** - *Error executing terraform plan*
+ **107** - *Error creating terraform configuration file on disk*
+ **108** - *Error destroying terraform infrastructure*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

`<vcommander-install>\tomcat\common\classes\log4j2.xml` 

+ **All Terraform Actions**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.terraform"/>`
