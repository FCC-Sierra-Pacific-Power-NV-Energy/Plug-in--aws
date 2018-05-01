# Starter Workflow Step Project

This project serves as a starting point for any new workflow step developed at Embotics or third party.

Features:
* Maven-like project structure
* Ivy dependency management
* Full suite of ant tasks
* Sample service usage
* Sample workflow task
* Sample localization
* Sample unit test
* Logging via com.embotics.vlm.facade.util.Logger

Make a copy of this project to start a new workflow step.

## Steps
+ Sample

### Sample
* Runs a sample task that performs various sample actions
* Has multiple inputs (partial list - fill in with actual inputs):
    * Text field for sample text
      * May or may not be validated
      * Another note could be made here
    * Radio selection
      * Explanation of what those radio buttons do
    * Others...

## Return Codes
### General Return Codes
Generic return codes
+ **0** - *Step completed successfully*
+ **100** - *Some general exception*

### Sample Return Codes (not implemented)
Return codes indicating status of resource action requests such as Sample
+ **1** - *This is a fake return code and means nothing*
+ **2** - *This is another fake return code and means nothing*

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j.properties"* to update the logging level.

+ **Sample**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.sample.workflow"/>`

## Notes
+ List any appropriate notes such as known issues in this section
