# Jenkins Plug-in Workflow Step Package

This package contains a vCommander plug-in workflow step that you can use to trigger a Jenkins job from vCommander. 

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Jenkins

### Jenkins
**Purpose:** Triggers a Jenkins job 

**Details:** Uses the Jenkins REST API https://wiki.jenkins.io/display/JENKINS/Remote+access+API

**Workflows supporting this plug-in step:**

 * All

**Inputs:** 

* Step Name: Input field for the name of the step
* Step Execution: Drop-down that sets the step execution behavior. By default, steps execute automatically. However, you can set the step to execute only for specific conditions.
* Sys Credentials:  System credentials to use for accessing the Jenkins server
* Jenkins Hostname: Input field for hostname or IP of the Jenkins server
* Job Name: Input field for name of the job to trigger 
* Job Parameters: Text area for parameters to include for parameterized builds. Use the URL query parameter format key1=value1&key2=value2 .

## Installation

Plug-in workflow steps are supported with vCommander release 7.0.2 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return codes

Standard HTTP return codes are used.

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

`<vcommander-install>\tomcat\common\classes\log4j2.xml` 

+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.jenkins.triggerjob"/>`

