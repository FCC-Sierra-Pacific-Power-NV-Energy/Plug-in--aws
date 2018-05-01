# Kubernetes Workflow Step Package

This package contains a collection of workflow steps for interacting with Kubernetes resources.

## Steps
+ Deploy Application
+ Remove Application
+ Run Best Practices Report

### Add to Inventory
* Adds a k8s cluster to vCommander inventory
* Has 2 inputs:
	* Input field for the name of the cluster. This is the friendly managed system name in vCommander
	* Input field for the cluster configuration in kubeconfig format
		* This field can contain a variable which resolves to the kubeconfig
		* If this field contains a file path that is accessible to the vCommander service account, the file is read and its contents are used as the kubeconfig

### Deploy Application
* Deploys a set of resources based on provided yaml descriptor in a manner similar to `kubectl --namespace="yourns" apply -f "yamlfile.yaml"`
* Has 3 YAML inputs:
    * Single line input field specifying the namespace to deploy the application to
        * If the namespace is not blank and the manifest specified namespace is ignored
        * If the namespace is blank, and the manifest specified namespace is not, then the latter is used
        * If both the namespace and the manifest specified namespace are blank, then the default namespace is used
    * Multiple line input field for the YAML manifests describing application to deploy
        * This should contain one or more manifests (separated by ---)
        * Note: If the namespace field is not blank, any namespace specified in the manifest is ignored
        * Note: If both the namespace field and manifest specified namespace is blank, then the default namespace is used
    * Deploy Type
        * Create - Creates a new resource (fails if resource already exists)
        * Update - Updates an existing resource (fails if resource does not exist)
        * Create or Update - Creates a new resource if the resource does not exist, and updates if the resource does exist
* Variable picker inputs are valid for the namespace and manifest field
    * The step can use an Upload File element in a form through the following variable: `#{target.settings.fileUpload['Test'].file[1].content}`
        * Note: `fileUpload['Test']` refers to the element name from the form and `file[1]` returns the first file from the element (there can be multiple) 

### Remove Application
* Removes a set of resources based on provided yaml descriptor in a manner similar to `kubectl --namespace="yamlns" delete -f "yamlfile.yaml"`
* Has 3 inputs:
    * Input field specifying the namespace to remove the application from
        * Note: If namespace is blank, the manifest must specify a namespace and if the namespace is not blank, the manifest specified namespace is ignored
    * Text field for the manifests to remove
        * This must contain one or more manifests (separated by ---)
        
### Run Best Practices Report
 * Executes a series of checks against a Kubernetes cluster and generates an xml report which can be written to disk as-is or transformed to html and emailed to recipients
 * Has 1 optional input, which is a path to a file containing the rule configuration
  * If this input is omitted the default set of rules is used
  * The default set of rules lives at http://svrrepo.embotics.com/development/vcommander/raw/master/labs/wf-step-plugins/wfplugins-k8s/resources/defaultBestPracticesRulesFile.yaml
  * **NOTE for Docs, this link should become public facing once the plugin and rules file are hosted elsewhere**
 * The content of this report is available after step execution in the step output, accessible with `#{steps['step name'].output}`
 * The content of this report uses the same format as Ant + Junit making it suitable to upload to tools such as Jenkins or to translate in to HTML using a XSLT stylesheet
  * See the `wfplugins-xslt` step and the full report workflow for more information **NOTE for Docs, link to public location of report workflow**


## Return Codes
### General Return Codes
Generic return codes

+ **0** - *Step completed successfully*
+ **100** - *Kubernetes returned a general exception*

### Resource Action Return Codes
Return codes indicating status of resource action requests, such as Deploy or Remove

+ **1** - *Invalid namespace value provided*
+ **2** - *YAML validation error*
+ **3** - *Provided namespace does not exist, it must be created first*
+ **4** - *Provided manifest namespace does not exist, it must be created first*
+ **5** - *Yaml provided could not be converted*
+ **6** - *Invalid Kubernetes manifest provided*
+ **7** - *Kubernetes returned a JSON exception (unmapped by this step)*
+ **8** - *Kubernetes returned an exception (unmapped by this step)*
+ **9** - *Resource already exists on the cluster and update is not enabled*
+ **10** - *Resource does not exist on the cluster and create is not enabled*
+ **11** - *Resource was not deleted as expected - see cluster for details*
+ **12** - *Invalid resource action type provided*

### Best Practices Report Return Codes
Return codes indicating status of Best Practices report generation
+ **7** - *Kubernetes returned a JSON exception (unmapped by this step)*
+ **50** - *Unable to read rules configuration file*

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.yamlutils"/>`

+ **Deploy Application**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource"/>`
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource.deploy"/>`

+ **Remove Application**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource"/>`
      + `<Logger level="DEBUG" name="wfplugins.k8s.resource.remove"/>`
    
+ **Best Practices Report **
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.k8s.bestpractices"/>`

## Notes
+ Selecting the "Update" deploy type for a namespace manifest will fail with the following error: *"Message: The namespace of the object (default) does not match the namespace on the request"*
    + If updating a namespace is required, use the "Create or update" deploy type
+ Updates to a Kubnetes cluster may not appear immediately after the step's completion because some time is allowed for the polling cycle to reset
    + To ensure the latest data appears in vCommander, you should manually synchronize the managed system
