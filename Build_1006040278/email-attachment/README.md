# Workflow Step Plugin to send an email with attachment

* This step plugin provides the capability to send an email with an optional attachment. 
* Has 6 inputs:
	* Required: Input field for the "To" recipients. Single email address or list of addresses separated with ;
	* Optional: Input field for the "CC" recipients. Single email address or list of addresses separated with ;
	* Required: Input field for the email subject.
	* Required: Text area for the email body.
   * Optional: Input field for the attachment. Can be a file accessible to vCommander service account or in-line content or a variable that resolves to a file or the attachment content
	* Optional: Input field for the attachment content type. Required if attachment is specified. Valid options are https://www.iana.org/assignments/media-types/media-types.xhtml


## Return Codes
### General Return Codes
Generic return codes

+ **0** - *Step completed successfully*

### Send Email with Attachment Return Codes
+ **1** - *Error creating attachment *
+ **2** - *Error sending email*

## Logging
Add the following named loggers to the Log4j configuration file located in *"\Embotics\vCommander\tomcat\common\classes\log4j2.xml"* to update the logging level.
        
+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.email.attachment"/>`