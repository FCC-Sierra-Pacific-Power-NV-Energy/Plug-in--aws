# PKS Plug-in Workflow Step Package

This package contains a collection of workflow steps for interacting with Pivotal Container Service (PKS) on vSphere without NSX-T.


## Plug-in steps in this package

- Create PKS Kubernetes cluster

+ Get PKS Kube Config

### Create PKS Kubernetes cluster
**Purpose:** Creates a Kubernetes cluster in a vSphere PKS environment.

**Workflows supporting this plug-in step:**

  * Command workflows
* Completion workflows for a VM
* Completion workflows for a service
* Completion workflows for a cloud template

**Inputs:**

* Step Name: Input field for the name of the step. 
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Cluster Name: Input field for the name of the cluster - the friendly managed system name in vCommander.
* PKS API Server: Input field for the PKS API server - the address of the load balancer for the PKS API and UAA server. Must be a FQDN.
* Username: Input field for the username to log into the PKS API server.
* Password: Input field for the password to log into the PKS API server.
* Plan Name: Input field for the plan name to use to create a PKS k8s cluster.
* Node Count: Input field for the number of worker nodes in the k8s cluster. If this field is blank, the default value from the plan is used.
* Doman Name: Input field for the domain name of the PKS environment.  **Note**: The FQDN for the load balancer is the <cluster-name>.<domain-name>
* Creation Timeout: Input field for timeout (in seconds) for creating a Kubernetes cluster

### Get PKS Kubeconfig
**Purpose:** Requests credentials (that is, kubeconfig) from PKS to be used to add the cluster to vCommander.

**Workflows supporting this plug-in step:**

* Command workflows
* Completion workflows for a VM
* Completion workflows for a service
* Completion workflows for a cloud template

**Inputs:**

* Step Name: Input field for the name of the step. 
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Cluster Name: Input field for the name of the cluster - the friendly managed system name in vCommander.
* PKS API Server: Input field for the PKS API server - the address of the load balancer for the PKS API and UAA server. Must be a FQDN.
* Username: Input field for the username to log into the PKS API server.
* Password: Input field for the password to log into the PKS API server.

## Installation

Plug-in workflow steps are supported with vCommander release 7.0.2 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return Codes

### Generic Return Codes
+ **0** - *Step completed successfully*
+ **100** - *vCommander returned a general exception*

### Create PKS Kubernetes cluster return codes
+ **1** - *PKS Credentials were not valid*
+ **2** - *Create cluster failed*

### Get PKS Kubeconfig return codes
+ **1** - *PKS Credentials were not valid*
+ **3** - *Invalid kube config returned*

## Logging
Add the following named loggers to the Log4j configuration file located in `\Embotics\vCommander\tomcat\common\classes\log4j2.xml` to update the logging level.
+ **Create PKS Kubernetes cluster**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.pks.createk8scluster"/>`

+ **Get PKS Kubeconfig**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.pks.getkubeconfig"/>` 
