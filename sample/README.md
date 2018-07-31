# [[Package Name]] Workflow Plug-in Step Package


This package contains a collection of vCommander workflow plug-in steps for *purpose*. 

It was designed specifically for use in *scenario title*.

*or*

It can be used in *scenario title*, but can also be used for other purposes, such as *purpose*.

*Example: This package contains a collection of vCommander workflow plug-in steps for interacting with Kubernetes resources*. *It was designed specifically for use in several Kubernetes [scenarios](https://github.com/Embotics/Scenarios), such as running a Kubernetes best practice report.*

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Friendly Step Name 1
+ Friendly Step Name 2

*Example: Deploy Application*

### Friendly Step Name 1
**Purpose:** *Purpose*

*Example: Adds a Kubernetes cluster to vCommander inventory*

**Details:** *Optional section; include links to related information, scenarios*

**Inputs:** *Bulleted list of inputs with guidance; indicate which are optional*

*Examples:*

* Input field for the name of the cluster. This is the friendly managed system name in vCommander.
* Input field for the cluster configuration, in kubeconfig format
  * This field can contain a variable which resolves to the kubeconfig.
  * If this field contains a file path that is accessible to the vCommander service account, the file is read and its contents are used as the kubeconfig.

### Friendly Step Name 2
**Purpose:** 

**Details:** 

**Inputs:** 

## Installation

Workflow plug-in steps are supported with vCommander release 7.0 and higher. 

See [Adding Workflow Plug-in Steps](http://docs.embotics.com/vCommander/Adding-Plug-In-WF-Steps.htm) in the vCommander documentation to learn how to install this package. 

## Return codes

### Generic return codes

*Examples:*

+ **0** - *Step completed successfully*
+ **100** - *Return code explanation*

### Additional return codes
*Optional section; replace "Additional" in heading with more specific word if possible, for example, "Resource Action Return Codes"*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

*Examples*:

+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.yamlutils"/>`

+ **Deploy Application** 
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource"/>`
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource.deploy"/>`


## Notes
*Optional section; bulleted list of limitations, troubleshooting, etc.*