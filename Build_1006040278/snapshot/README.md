# Snapshot Workflow Step

This project contains 3 workflow step plugins

## Create Snapshot
* Creates a new snapshot with the provided options
* Has 4 inputs
   * Input field for Snapshot name
   * Input field for Snapshot description (optional)
   * Checkbox for Quiesce Filesystem
   * Checkbox for Capture Memory
* See vCenter Client for more info on these fields

## Delete Snapshot
 * Deletes the latest snapshot with a given name
 * Has 1 input
     * Input field for Snapshot name 

## Revert Snapshot
* Reverts to the latest snapshot with a given name
* Has 1 input
   * Input field for Snapshot name 

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="plugin.snapshot"/>`