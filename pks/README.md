# PKS Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a collection of workflow steps for interacting with Pivotal Container Service (PKS) on vSphere without NSX-T.

It was designed specifically for use in the vCommander workflow extension scenario *Deploying a Kubernetes Cluster on vSphere through PKS*, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package

- Create PKS Kubernetes cluster

+ Get PKS Kube Config

### Create PKS Kubernetes cluster
**Purpose:** Creates a Kubernetes cluster in a vSphere PKS environment and creates a load balancer front-end

**Inputs:**

* Input field for the name of the cluster - the friendly managed system name in vCommander.
* Input field for the PKS API server - the address of the load balancer for the PKS API and UAA server. Must be an FQDN or IP address.
* Input field for the username to log into the PKS API server.
* Input field for the password to log into the PKS API server.
* Input field for the plan name to use to create a PKS k8s cluster.
* Input field for the number of worker nodes in the k8s cluster.
  * If this field is blank, the default value from the plan is used.

* Input field for the domain name of the PKS environment.
   * Note: The FQDN for the load balancer is the <cluster-name>.<domain-name>

### Get PKS Kube Config
**Purpose:** Requests credentials (i.e. kube config) from PKS to be used to add the cluster to vCommander.

**Inputs:**

* Input field for the name of the cluster - the friendly managed system name in vCommander

   * Input field for the PKS API server - the address of the load balancer for the PKS API and UAA server. Must be an FQDN or IP address.
* Input field for the username to log into the PKS API server.
* Input field for the password to log into the PKS API server.

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return Codes

### Generic Return Codes
+ **0** - *Step completed successfully*
+ **100** - *vCommander returned a general exception*

### Create PKS Kubernetes cluster return codes
+ **1** - *PKS Credentials were not valid*
+ **2** - *Create cluster failed*

### Get PKS Kube Config return codes
+ **1** - *PKS Credentials were not valid*
+ **3** - *Invalid kube config returned*

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j.properties"* to update the logging level.
+ **Create PKS Kubernetes cluster**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.pks.createk8scluster"/>`

+ **Get PKS Kube Config**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.pks.getkubeconfig"/>`
