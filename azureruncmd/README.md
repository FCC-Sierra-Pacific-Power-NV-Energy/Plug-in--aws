# azureruncommand Workflow Plug-in Step Package

This package contains a vCommander workflow plug-in step for running commands on virtual machines hosted in Microsoft Azure.

## Change log

**Version 1.0:** Initial version.

## Plug-in steps in this package
+ Run Command

### Run Command
**Purpose:** *Run a command on the target VM using Azure RunCommand API*

**Workflows supporting this plug-in step:** *Bulleted list of supported workflow types*

  * Change Request Approval
  * Change Request Completion
  * New Request Approval
  * VM Completion
  * Service Completion
  * Virtual Service Completion
  * Custom Component Completion
  * Cloud Template Completion
  * Shared VM Completion
  * Command

**Inputs:**

  * Command - The command to run on the target


## Installation

Workflow plug-in steps are supported with vCommander release 7.0 and higher. 

See [Adding Workflow Plug-in Steps](http://docs.embotics.com/vCommander/Adding-Plug-In-WF-Steps.htm) in the vCommander documentation to learn how to install this package. 

## Return codes

+ **0** - *Step completed successfully*
+ **10** - *Command executed with error condition*
+ **20** - *Failed to run command*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

*Examples*:

+ **General**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.azureruncommand"/>`
      + `<Logger level="DEBUG" name="wfplugins.azureruncommand.task"/>`
      + `<Logger level="DEBUG" name="wfplugins.azureruncommand.workflow"/>`


## Notes
* PowerShell commands that do not explicitly set an exit code will always return as "successful"
* When the command fails, Azure will throw an exception.