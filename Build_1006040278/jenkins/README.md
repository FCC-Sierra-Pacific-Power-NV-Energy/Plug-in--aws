# Jenkins Workflow Step Plugins
* Uses Jenkins REST API https://wiki.jenkins.io/display/JENKINS/Remote+access+API

## Step Plugin to trigger a Jenkins job
* Has 4 inputs
 * Credentials: - System credentials to use for accessing the Jenkins server
 * Jenkins Hostname: Text input field for hostname or IP of the Jenkins server
 * Job Name: Text input field for name of the job to trigger 
 * Job Parameters: Text area for parameters to include for parameterized builds. URL query parameter format (key1=value1&key2=value2)

## Return Codes
 * Standard HTTP return codes are used

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.jenkins.triggerjob"/>`