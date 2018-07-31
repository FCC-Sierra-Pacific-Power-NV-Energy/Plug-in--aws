# Email Plug-in Workflow Step Package
# vCommander Supported Build Version 1006050089

This package contains a vCommander plug-in workflow step for sending an email with an attachment.

It can be used with several vCommander workflow extension scenarios, which can be found on the [Embotics Support Knowledge Base](https://support.embotics.com/support/home). It can also be used outside of vCommander scenarios.

## Changelog

**Version 1.0:** Initial version.

## Plug-in steps in this package

+ Email Attachment

### Email Attachment

**Purpose:** Sends an email with an optional attachment.

**Inputs:**

* Required: Input field for the "To" recipients. Single email address or semi-colon-separated list of addresses 
* Optional: Input field for the "CC" recipients. Single email address or or semi-colon-separated list of addresses
* Required: Input field for the email subject
* Required: Text area for the email body
* Optional: Input field for the attachment. Can be a file accessible to the vCommander service account, in-line content, or a variable that resolves to a file or the attachment content
* Optional: Input field for the attachment content type. Required if attachment is specified. Valid options are https://www.iana.org/assignments/media-types/media-types.xhtml

## Installation

Plug-in workflow steps are supported with vCommander release 7.0 and higher. 

See [Adding plug-in workflow steps](http://docs.embotics.com/vCommander/Using-Plug-In-WF-Steps.htm#Adding) in the vCommander documentation to learn how to install this package. 

## Return codes

### Generic return codes
+ **0** - *Step completed successfully*

### Send Email with Attachment return codes

+ **1** - *Error creating attachment*
+ **2** - *Error sending email*

## Logging
To change the logging level, add the following named loggers to the Log4j configuration file located at: 

<vcommander-install>\tomcat\common\classes\log4j2.xml 

+ **General Utilities**
    + Loggers:
      + `<Logger level="DEBUG" name="wfplugins.email.attachment"/>`