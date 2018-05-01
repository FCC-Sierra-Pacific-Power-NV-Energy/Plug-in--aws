# Azure Workflow Step Plugins

## Step Plugin to Retrieve an AZURE AKS k8s kubeconfig

This folder contains a plug-in workflow step to retrieve the kubeconfig of an AKS k8s cluster created through an ARM template in a vCommand service.  A service component should be created with a using an ARM template designed to deploy an AKS k8s cluster.  A completion workflow for the component should be created to call this workflow step plug-in, GET_AKS_KUBE_CONFIG, as the first step, and the "Add K8S To Inventory" workflow step, GET_AKS_KUBE_CONFIG, as the second step.

This step plug-in uses the DEPLOYMENT_RECORD from the successfully deployed ARM template to login to the AZURE service and retrieve the kubeconfig. The kubeconfig is passed as this step's "output" to be read by the "Add K8S To Inventory" step.

## Design

AZURE credentials are retrieved from the vCommand CredentialService.  The AZURE REST API is called to retrieve an OAuth2 access token.  The AZURE subscription ID, resource group ID and AKS k8s cluster name as used to retrieve the kubeconfig through the AZURE REST API.  The kubconfig is returned as the step's output.

## Return Codes
### General Return Codes
Generic return codes

+ **0** - *Step completed successfully*
+ **100** - *Azure returned a general exception*

### Get AKS Kubeconfig Return Codes
Return codes indicating status of resource action requests such as Deploy or Remove

+ **1** - *Error authenticating with Azure using OAuth*
+ **2** - *Error building kubeconfig from response*

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.aks.getkubeconfig"/>`