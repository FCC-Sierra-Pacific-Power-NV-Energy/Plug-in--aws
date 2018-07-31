# Kubernetes Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a collection of vCommander plug-in workflow steps for interacting with Kubernetes resources. It was designed specifically for use in several Kubernetes scenarios, such as running a Kubernetes best practice report, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package

+ Kubernetes Add to Inventory
+ Kubernetes Best Practices 
+ Kubernetes Copy Cluster
+ Kubernetes Deploy Application
+ Kubernetes Remove Application

### Kubernetes Add to Inventory

**Details:**

- Adds a Kubernetes cluster as a vCommander managed system
- Supported in Completion and Command workflows

**Inputs:**

- Input field for the name of the cluster. This is the friendly managed system name in vCommander.
- Input field for the cluster configuration in kubeconfig format
  - This field can contain a variable that resolves to the kubeconfig
  - If this field contains a file path that is accessible to the vCommander service account, the file is read and its contents are used as the kubeconfig

### Kubernetes Best Practices 

**Details:**

- Executes a series of checks against a Kubernetes cluster and generates an XML report which can be written to disk as-is or transformed to HTML and emailed to recipients
- Supported only in Command workflows
- The content of this report is available after step execution in the step output, accessible with `#{steps['step name'].output}`
- The content of this report uses the same format as Ant + Junit, making it suitable to upload to tools such as Jenkins or to translate in to HTML using an XSLT stylesheet
- To learn more, see the scenario *Running a Kubernetes Best Practices Report*, available from the [Embotics Support Knowledge Base](https://support.embotics.com/support/home).

**Inputs:**

- Has one optional input, which is a path to a file containing the rule configuration
- If this input is omitted, the default set of rules is used (defaultBestPracticesRulesFile.yaml can be downloaded from the same location as this plug-in step package)

### Kubernetes Copy Cluster

**Details:**

* Copies the cluster targeted by the command workflow
* Supported only in Command workflows

**Inputs:**

* New Cluster Name: Mandatory. The name to apply to the copied cluster.

### Kubernetes Deploy Application

**Details:**

- Supported only in Command workflows
- Deploys a set of resources based on the provided YAML descriptor in a manner similar to `kubectl --namespace="yamlns" apply -f "yamlfile.yaml"`

**Inputs:**
  - Namespace - Input field to specify the namespace to which the application will be deployed
    - If the Namespace field is not blank, the manifest-specified namespace is ignored
    - If the Namespace field is blank, and the manifest is provided, then the latter is used
    - If both the Namespace and the manifest-specified namespace are blank, then the default namespace is used
  - K8s YAML Manifest - Input field allowing input of YAML manifests that describe the application to deploy
    - Should contain one or more manifests (separated by ---)
    - If the Namespace field is not blank, any namespace specified in the manifest is ignored
    - If the Namespace field is blank and no namespace is specified in the manifest, the default namespace is used
  - Deploy Type
    - Create or Update - Creates a new resource if the resource does not exist, and updates if the resource does exist
    - Create only - Creates a new resource (fails if resource already exists)
    - Update only - Updates an existing resource (fails if resource does not exist)
- Variable inputs are permitted in the Namespace and Manifest field
  - The step can use an Upload File element in a form through the following variable: `#{target.settings.fileUpload['Test'].file[1].content}`
    - Note: `fileUpload['Test']` refers to the element name from the form and `file[1]` returns the first file from the element (there may be multiple) 

### Kubernetes Remove Application

**Details:**

- Supported only in Command workflows
- Removes a set of resources based on provided yaml descriptor in a manner similar to `kubectl --namespace="yamlns" delete -f "yamlfile.yaml"`

**Inputs:**

- Namespace - Input field specifying the namespace to remove the application from
  - If blank, the manifest must specify a namespace; if not blank, the manifest-specified namespace is ignored
- K8s YAML manifest - Text field for the manifests to be removed
  - This must contain one or more manifests (separated by ---)

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

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

- Selecting the "Update" deploy type for a namespace manifest will fail with the following error: *"Message: The namespace of the object (default) does not match the namespace on the request"*. If updating a namespace is required, use the "Create or update" deploy type.
- Updates to a Kubernetes cluster may not appear immediately after the step's completion because some time is allowed for the polling cycle to reset. To ensure the latest data appears in vCommander, manually synchronize the managed system's inventory.
- The Deploy Application step does not provide support for all Kubernetes resources. For example, the ClusterRoleBinding resource should be pre-deployed on the Kubernetes cluster to be used in an application