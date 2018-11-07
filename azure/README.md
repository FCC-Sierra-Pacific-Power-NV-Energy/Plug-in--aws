# Azure Plug-in Workflow Step Package

This package contains a vCommander plug-in workflow step to retrieve the kubeconfig of an AKS Kubernetes cluster created through an Azure template in a vCommander service. 

It was designed specifically for use in the scenario *Deploying a Kubernetes Cluster on Azure AKS*, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Get AKS Kubeconfig

### Get AKS Kubeconfig
**Purpose:** Retrieves the kubeconfig of an AKS Kubernetes cluster that is created through an ARM template in vCommander.

**Details:** Azure credentials are retrieved from vCommander. The Azure REST API is called to retrieve an OAuth2 access token. The Azure subscription ID, resource group ID and AKS k8s cluster name are used to retrieve the kubeconfig through the Azure REST API. The kubeconfig is returned as the step's output.

**Workflows supporting this plug-in step:**

 * Command workflows
 * Completion workflows for a VM
 * Completion workflows for a service
 * Completion workflows for a cloud template

**Inputs:** 

* Step Name: Input field for the name of the step. 
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Cluster Name: Input field for the name of the cluster. This is the friendly managed system name in vCommander.

## Installation

Plug-in workflow steps are supported with vCommander release 7.0.2 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return codes

### Generic return codes

*Examples:*

+ **0** - *Step completed successfully*
+ **100** - *Azure returned a general exception*

### Get AKS kubeconfig return codes

Return codes indicating status of resource action requests, such as Deploy or Remove.

- **1** - *Error authenticating with Azure using OAuth*
- **2** - *Error building kubeconfig from response*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

`<vcommander-install>\tomcat\common\classes\log4j2.xml` 

+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.aks.getkubeconfig"/>`

